class SchedulesController < ApplicationController
  def new
    @form = Form::ScheduleCollection.new
    #@schedule = Schedule.new
  end

  def create
    @form = Form::ScheduleCollection.new(schedule_collection_params)
    binding.pry
    if @form.save
      redirect_to schedule_path
    else
      render :new
    end
    # #schedule_time = Time.parse(time_str)
    # # スケジュールを保存
    # @schedule = Schedule.new(schedule_params)
    # @schedule.schedule_time = schedule_time
    # # if @schedule.save
    # #   # スケジュールの保存が成功した場合の処理
    # #   redirect_to @schedule, notice: 'スケジュールが作成されました。'
    # # else
    # #   # スケジュールの保存が失敗した場合の処理
    # #   render :new, status: :unprocessable_entity
    # # end
  end

  private
  def schedule_collection_params
    params.require(:form_schedule_collection).permit(schedule_attributes: [:schedule_time, :task, :memo, :goal_select])
  end
end
