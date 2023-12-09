class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(first_login: false) # 初回ログイン時のみ目標設定画面へリダイレクト
      auto_login(@user)
      flash[:success] = 'ユーザー登録が完了しました'
      redirect_to new_goal_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      binding.pry
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to profiles_path
    else
      flash.now[:error] = 'ユーザー情報の更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
