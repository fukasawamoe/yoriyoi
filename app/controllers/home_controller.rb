class HomeController < ApplicationController
  before_action :require_login
  before_action :set_home, only: %i(index)
  include HomeHelper

  def index
    # scheduleのview
    @schedules = current_day_schedules(current_user)
    @current_task, @next_task = current_and_next_tasks(@schedules)

    # 次のタスクが存在しない場合、次の曜日の最初のタスクを取得
    if @next_task.nil?
      next_day_schedules = next_day_schedules(current_user)
      @next_task = next_day_schedules.map(&:tasks).flatten.min_by(&:task_time)
    end

    # ai_messageのview(現在のタスクをOpenAIクライアントに渡す)
    # OpenAiClientはChat GPTのAPIを使用して、現在のタスクに基づいた応答を生成する
    if @current_task.present?
      client = OpenAiClient.new(@current_task, @character)
      @response = client.chat
    end

    # @true_countsはachievementのグラフの計算に使用される
    @true_counts = Achievement.joins(:step).where(steps: { user_id: current_user.id }, daily: Date.today - 6.days..Date.today, check: true).count
    @user = current_user
  end


  private

  def set_home
    @goal = Goal.find_by(user_id: current_user.id)
    @steps = Step.where(user_id: current_user.id)
    @character = Character.find_by(user_id: current_user.id)
  end
end
