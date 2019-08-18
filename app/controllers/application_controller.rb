class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  add_flash_types :success, :error

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :phone, location_attributes: [:street, :city, :state, :zip]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :phone, location_attributes: [:street, :city, :state, :zip]])
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"
    redirect_to(request.referrer || root_path)
  end
end
