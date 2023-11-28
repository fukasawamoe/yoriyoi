class AchievementsController < ApplicationController
  before_action :set_step
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  def index
    @achievements = Achievement.all
  end

  def show; end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = current_user.achievements.build(achievement_params)
    @achievement.step_id = @step.id

    if @achievement.save
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    step = current_user.achievements.find(params[:id])
    current_user.not_achieved(achievement)
    redirect_back fallback_location: root_path
  end

  private

  def set_step
    @goal = Goal.find_by(user_id: current_user.id)
    @step = Step.find_by(goal_id: @goal.id)
  end

  
end
