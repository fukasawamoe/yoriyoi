class ProfilesController < ApplicationController
  before_action :set_user, only: %i(show profile_edit profile_update)
  before_action :set_character, only: %i(show character_edit profile_update)
  def profile_edit; end

  def profile_update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to profiles_path
    else
      flash.now[:error] = 'プロフィールの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def character_edit; end

  def character_update
    if @character.update(character_params)
      flash[:success] = 'AIキャラクターを更新しました'
      redirect_to profiles_path
    else
      flash.now[:error] = 'AIキャラクターの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_character
    @character = Character.find_by(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def character_params
    params.require(:character).permit(:name, :personality, :communication_style, :relationship, :additional, :image)
  end
end
