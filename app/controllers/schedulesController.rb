class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    schedule_time = Time.parse(time_str)
  binding.pry
    # スケジュールを保存
    @schedule = Schedule.new(schedule_params)
    @schedule.schedule_time = schedule_time
  binding.pry
    # if @schedule.save
    #   # スケジュールの保存が成功した場合の処理
    #   redirect_to @schedule, notice: 'スケジュールが作成されました。'
    # else
    #   # スケジュールの保存が失敗した場合の処理
    #   render :new, status: :unprocessable_entity
    # end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:schedule_time, :task, :memo, :goal_select)
  end
end
