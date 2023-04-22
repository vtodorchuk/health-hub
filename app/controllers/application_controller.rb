class ApplicationController < ActionController::Base
  USER_ATTRIBUTES_SIGN_UP = %i[first_name last_name email password phone gender birthday].freeze

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: USER_ATTRIBUTES_SIGN_UP)
    devise_parameter_sanitizer.permit(:account_update, keys: USER_ATTRIBUTES_SIGN_UP)
  end
end
