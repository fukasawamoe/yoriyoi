class HomesController < ApplicationController

  def show
  #scheduleのview
    # 現在の曜日を取得（0:日曜日, 1:月曜日, ..., 6:土曜日）
    current_day_of_week = Time.current.wday
    # ログインユーザーが作成したスケジュールを取得
    @schedules = current_user.schedules.includes(:tasks).where('day_of_week @> ARRAY[?]::integer[]', current_day_of_week)
    # 現在の時間を取得
    current_time = Time.current.strftime("%H:%M")

    # 現在のタスクと次のタスクを取得
    tasks = @schedules.map(&:tasks).flatten.sort_by(&:task_time)
    @current_task = tasks.select { |task| task.task_time.strftime("%H:%M") <= current_time }.last
    @next_task = tasks.select { |task| task.task_time.strftime("%H:%M") > current_time }.first

    # 次のタスクが存在しない場合、次の曜日の最初のタスクを取得
    if @next_task.nil?
      next_day_of_week = (current_day_of_week + 1) % 7
      next_day_schedules = current_user.schedules.includes(:tasks).where('day_of_week @> ARRAY[?]::integer[]', next_day_of_week)
      @next_task = next_day_schedules.map(&:tasks).flatten.min_by(&:task_time)
    end
    #JSを読み込む
    respond_to do |format|
      format.html
      format.js { render partial: 'next_task', locals: { task: @next_task } }
    end
  #ai_messageのview(現在のタスクをOpenAIクライアントに渡す)
    client = OpenAiClient.new(@current_task)
    @response = client.chat

  #Goalのview
    @goal = Goal.find_by(user_id: current_user.id)
  #Stepのview
    @step = Step.find_by(goal_id: @goal.id)
  end
end
