class SchedulesController < ApplicationController
  before_action :require_login
  before_action :set_schedule, only: %i(update destroy)
  before_action :set_task, only: %i(show edit)
  def index
    @schedules = current_user.schedules.all
  end

  def new
    @schedule = Schedule.new
    @task = @schedule.tasks.build
  end

  def create
    # tasks_attributes をハッシュから配列に変換
    tasks_attributes_array = params[:schedule][:tasks_attributes].values

    tasks_attributes_array.each do |task_attributes|
      if task_attributes["task_time(4i)"].blank? || task_attributes["task_time(5i)"].blank?
        @schedule = current_user.schedules.build(schedule_params)
        @schedule.errors.add(:base, 'タスクを行う時間を入力してください')
        flash.now[:alert] = 'スケジュールの作成に失敗しました。'
        render :new, status: :unprocessable_entity
        return
      end
    end

    # 配列をソート
    sorted_tasks_attributes = tasks_attributes_array.sort_by do |task_attributes|
      task_time_hour = task_attributes["task_time(4i)"].to_i
      task_time_minute = task_attributes["task_time(5i)"].to_i
      task_time_hour * 60 + task_time_minute
    end

    # ソートされた配列を再度ハッシュ形式に変換
    sorted_tasks_hash = sorted_tasks_attributes.each_with_index.map { |attrs, index| [index.to_s, attrs] }.to_h

    # 新しいパラメータとしてマージ
    merged_params = schedule_params.merge(tasks_attributes: sorted_tasks_hash)

    @schedule = current_user.schedules.build(merged_params)

    if @schedule.save
      flash[:notice] = 'スケジュールを作成しました'
      redirect_to schedule_path(@schedule)
    else
      flash.now[:alert] = 'スケジュールの作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    params[:schedule][:tasks_attributes].each do |_, task_attributes|
      if task_attributes["task_time(4i)"].blank? || task_attributes["task_time(5i)"].blank?
        @schedule.errors.add(:base, 'タスクを行う時間を入力してください')
        render :edit, status: :unprocessable_entity
        return
      end
    end

    if @schedule.update(schedule_params)
      # task_time順で並び替えてpositionカラムを更新
      @schedule.tasks.order(:task_time).each.with_index(1) do |task, index|
        task.update_column(:position, index)
      end
      flash[:notice] = 'スケジュールを更新しました'
      redirect_to schedule_path(@schedule)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = current_user.schedules.find_by_hashid(params[:id])
  end

  def set_task
    @schedule = current_user.schedules.find_by_hashid(params[:id])
    @tasks = @schedule.tasks.order(:task_time)
  end

  def schedule_params
    params.require(:schedule).permit(:name, day_of_week: [],
                                    tasks_attributes: [:id, :task_time, :to_do, :memo, :goal_select, :position, :_destroy])
  end
end
