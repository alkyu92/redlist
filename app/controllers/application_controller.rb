class ApplicationController < ActionController::Base
  before_action :devise_params, if: :devise_controller?
  after_action  :store_location
  protect_from_forgery with: :exception

  protected

  def devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :attached])
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
end
