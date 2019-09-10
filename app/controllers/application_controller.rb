class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :description, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
