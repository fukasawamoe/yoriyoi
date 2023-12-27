class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_profile, only: %i(index)

  def index; end

  private

  def set_profile
    @user = User.find(current_user.id)
    @character = Character.find_by(user_id: current_user.id)
  end
end
