class CharactersController < ApplicationController
  before_action :set_character, only: [:edit, :update]

  def edit; end

  def update
    if @character.update(character_params)
      flash[:success] = 'AIキャラクターを更新しました'
      redirect_to profiles_path
    else
      flash.now[:error] = 'AIキャラクターの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_character
    @character = Character.find_by(user_id: current_user.id)
  end

  def character_params
    params.require(:character).permit(:name, :personality, :communication_style, :relationship, :additional, :image)
  end
end
