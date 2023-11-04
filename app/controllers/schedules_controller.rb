class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  def index
    @schedules = current_user.schedules.all
  end

  def new
    @schedule = Schedule.new
    @task = @schedule.tasks.build
  end

  def create
    if params[:schedule][:tasks_attributes]
      #formが空であれば年月日を削除してnilになる
      params[:schedule][:tasks_attributes].each do |_, task_attributes|
        if task_attributes["task_time(4i)"].blank? && task_attributes["task_time(5i)"].blank?
          task_attributes.delete("task_time(1i)")
          task_attributes.delete("task_time(2i)")
          task_attributes.delete("task_time(3i)")
        end
      end

      # タスクを時間順に並び替え
      sorted_tasks_attributes = params[:schedule][:tasks_attributes].values.sort_by do |task_attributes|
        task_attributes["task_time(4i)"].to_i * 60 + task_attributes["task_time(5i)"].to_i
      end

      # ストロングパラメータに変換
      sorted_tasks_attributes = ActionController::Parameters.new(tasks: sorted_tasks_attributes).permit!

      # 並び替えたタスクのパラメータを使用してスケジュールを作成
      @schedule = current_user.schedules.build(schedule_params.merge(tasks_attributes: sorted_tasks_attributes[:tasks]))
    end
    if @schedule.save
      flash[:success] = 'スケジュールを作成しました'
      redirect_to schedule_path(@schedule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tasks = @schedule.tasks.order(:task_time)
  end

  def edit
    @tasks = @schedule.tasks.order(:task_time)
  end

  def update
    params[:schedule][:tasks_attributes].each do |_, task_attributes|
      if task_attributes["task_time(4i)"].blank? && task_attributes["task_time(5i)"].blank?
        task_attributes.delete("task_time(1i)")
        task_attributes.delete("task_time(2i)")
        task_attributes.delete("task_time(3i)")
      end
    end

    if @schedule.update(schedule_params)
      # task_time順で並び替えてpositionカラムを更新
      @schedule.tasks.order(:task_time).each.with_index(1) do |task, index|
        task.update_column(:position, index)
      end
      flash[:success] = 'スケジュールを更新しました'
      redirect_to schedule_path(@schedule)
    else
      render :edit
    end
  end

  def destroy
    @schedule.tasks.destroy_all
    @schedule.destroy
    redirect_to schedules_path
  end


  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, {day_of_week: []},
                                    tasks_attributes:[:id, :task_time, :to_do, :memo, :goal_select, :position, :_destroy])
  end
end
