class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @task = @schedule.tasks.build
  end

  def create
    params[:schedule][:tasks_attributes].each do |_, task_attributes|
      if task_attributes["task_time(4i)"].blank? && task_attributes["task_time(5i)"].blank?
        task_attributes.delete("task_time(1i)")
        task_attributes.delete("task_time(2i)")
        task_attributes.delete("task_time(3i)")
      # else
      # # 現在の年月日を取得
      #   year = Time.zone.now.year
      #   month = Time.zone.now.month
      #   day = Time.zone.now.day
      #   hour = task_attributes["task_time(4i)"].to_i
      #   minute = task_attributes["task_time(5i)"].to_i

      #   task_time = Time.zone.local(year, month, day, hour, minute)
      #   task_attributes[:task_time] = task_time # この行を追加
      end
    end

    @schedule = current_user.schedules.build(schedule_params)

    if @schedule.save
    binding.pry
      redirect_to schedule_path(@schedule), notice: 'スケジュールが作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    params[:schedule][:tasks_attributes].each do |_, task_attributes|
      if task_attributes["task_time(4i)"].blank? && task_attributes["task_time(5i)"].blank?
        task_attributes.delete("task_time(1i)")
        task_attributes.delete("task_time(2i)")
        task_attributes.delete("task_time(3i)")
      end
    end

    if @schedule.update(schedule_params)
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
                                    tasks_attributes:[:id, :task_time, :to_do, :memo, :goal_select, :_destroy])
  end
end
