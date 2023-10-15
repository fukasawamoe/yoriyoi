class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      if @user.first_login
        @user.update(first_login: false)
        redirect_to new_goal_path # 初回ログイン時のみ目標設定画面へリダイレクト
      else
        redirect_to home_path(current_user.id), flash: { success: 'ログインしました' } # 2回目以降のログイン時はホーム画面へリダイレクト
      end
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { notice: 'ログアウトしました' }
  end
end
