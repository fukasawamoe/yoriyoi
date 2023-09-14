class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @task = @schedule.tasks.build
  end

  def create

    @schedule = current_user.schedules.build(schedule_params)

  binding.pry
    if @schedule.save
      redirect_to schedule_path, notice: 'スケジュールが作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name,
                                    task_attributes:[:task_time, :to_do, :memo, :goal_select, :_destroy])
  end
end
