class AchievementsController < ApplicationController
  before_action :set_step
  before_action :set_achievement, only: [:show, :edit, :update]

  def index
    @achievements = Achievement.all
  end

  def show; end

  def new
    @achievement = Achievement.new
  end

  def create
    # 現在のユーザーに関連付けられた新しい達成項目を作成
    @achievement = current_user.achievements.build(achievement_params)
    # set_stepの@stepを使用して設定
    @achievement.step_id = @step.id

    if @achievement.save
      redirect_to home_index_path
    else
      render :new
    end
  end

  private

  def set_step
    @goal = Goal.find_by(user_id: current_user.id)
    @step = Step.find_by(goal_id: @goal.id)
  end
end
