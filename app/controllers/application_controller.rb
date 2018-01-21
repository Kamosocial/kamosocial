class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  rescue_from ArgumentError do |exception|
     flash.now[:alert] = "Arguments for your request are incorrect"
     redirect_to root_url, :alert => exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :first_name, :last_name, :interests_list, :places_list])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :interests_list, :places_list])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :interests_list, :places_list])
  end
end
