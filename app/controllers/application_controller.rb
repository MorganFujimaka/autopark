class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: controller_name.singularize.capitalize << " cannot be found"
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  add_flash_types :success

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :auth_token
  end
end
