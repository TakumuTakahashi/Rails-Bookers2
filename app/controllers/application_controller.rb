class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
  #deviseで利用出来るパラメーターを設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) 
  end

end
