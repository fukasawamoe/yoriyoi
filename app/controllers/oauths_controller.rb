class OauthsController < ApplicationController

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if (@user = login_from(provider))
      flash[:success] = 'ログインしました'
      redirect_to home_index_path
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        flash[:success] = 'ログインしました'
        redirect_to home_index_path
      rescue StandardError
        flash[:error] = 'ログインに失敗しました'
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end
end