class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:photo, :name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:photo, :name])
  end
  skip_before_action :verify_authenticity_token, raise: false
end
