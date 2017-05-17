class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:first_name, :last_name, :birthdate, :study_path_id])
  end

  def destroy
  signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
  yield if block_given?
  respond_to_on_destroy
end

def layout_by_resource
    if controller_name == 'sessions' || devise_controller? && !['edit', 'update', 'delete'].include?(action_name)
      "simple"
    else
      "application"
    end
  end
end
