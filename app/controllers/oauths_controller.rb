class OauthsController < ApplicationController

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    # 'login_from'メソッドを使い、以前に保存された認証データからユーザーをログインさせます。
    # 成功すれば、@user変数にユーザー情報が格納されます。
    if (@user = login_from(provider))
      flash[:notice] = 'ログインしました'
      redirect_to home_index_path
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        flash[:notice] = 'ログインしました'
        redirect_to new_goal_path
      rescue StandardError
        flash[:alert] = 'ログインに失敗しました'
        redirect_to login_path
      end
    end
  end

  private

  def auth_params
    params.permit(:name, :code, :provider, :error, :state)
  end
end
