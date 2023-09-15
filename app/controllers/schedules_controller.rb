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

    @schedule = current_user.schedules.build(schedule_params)
    binding.pry
    if @schedule.save
      redirect_to schedule_path(@schedule), notice: 'スケジュールが作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    binding.pry
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to homes_path
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name,
                                    tasks_attributes:[:id, :task_time, :to_do, :memo, :goal_select, :_destroy])
  end
end
