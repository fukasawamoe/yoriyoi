class AchievementsController < ApplicationController
  def create
    step = Step.find(params[:step_id])
    current_user.achievement(step)
    redirect_back fallback_location: root_path
  end

  def destroy
    step = current_user.achievements.find(params[:id]).step
    current_user.not_achieved(step)
    redirect_back fallback_location: root_path
  end
end
