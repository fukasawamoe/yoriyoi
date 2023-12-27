class ApplicationController < ActionController::Base
  protected

  def not_authenticated
    flash[:error] = 'ログインしてください'
    redirect_to root_path
  end
end
