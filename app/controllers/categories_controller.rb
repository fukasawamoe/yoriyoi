class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Form::Schedule.new

  end

  def create
  #   task_time = Time.parse(time_str)
  # binding.pry
    # スケジュールを保存
    @schedule = Form::Schedule.new(schedule_params)

  binding.pry
    if @schedule.save
      # スケジュールの保存が成功した場合の処理
      redirect_to schedule_path, notice: 'スケジュールが作成されました。'
    else
      # スケジュールの保存が失敗した場合の処理
      render :new, status: :unprocessable_entity
    end
  end

  private
  def schedule_params
    params.require(:form_schedule).permit(
                                    Form::Schedule::REGISTRABLE_ATTRIBUTES +
                                    [schedule_tasks_attributes: Form::Scheduletask::REGISTRABLE_ATTRIBUTES])
  end
end
