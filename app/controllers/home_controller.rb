class HomeController < ApplicationController
  before_action :require_login
  before_action :set_home, only: %i(index)
  # before_action :create_daily_achievements, only: :index

  def index
    # scheduleのview
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

    # ai_messageのview(現在のタスクをOpenAIクライアントに渡す)
    # if @current_task.present?
    #   client = OpenAiClient.new(@current_task, @character)
    #   @response = client.chat
    # end
  end


  private

  def set_home
    @goal = Goal.find_by(user_id: current_user.id)
    @steps = Step.where(user_id: current_user.id)
    @character = Character.find_by(user_id: current_user.id)
  end

  # def create_daily_achievements
  #   current_user.steps.includes(:achievements).each do |step|
  #     unless step.achievements.exists?(daily: Date.current)
  #       step.achievements.create!(daily: Date.current)
  #     end
  #   end
  # end
end
