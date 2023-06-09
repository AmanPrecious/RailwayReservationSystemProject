class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  
	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:mobile,:address])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
