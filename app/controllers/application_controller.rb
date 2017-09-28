class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :anyone_signed_in?

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def anyone_signed_in?
    teacher_signed_in? || learner_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
