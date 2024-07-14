class ApplicationController < ActionController::Base
  protected

  def not_authenticated
    flash[:alert] = I18n.t('errors.messages.not_authenticated')
    redirect_to root_path
  end
end
