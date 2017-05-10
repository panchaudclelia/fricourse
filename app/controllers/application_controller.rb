class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :birthdate])
  end

  def layout_by_resource
    if devise_controller? && action_name != 'edit'
      "simple"
    else
      "application"
    end
  end
end
