class ProfilesController < ApplicationController
  before_action :require_login

  def index
    @user = User.find(current_user.id)
    @character = Character.find_by(user_id: current_user.id)
  end
end
