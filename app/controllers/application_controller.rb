class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user_role

  protected


  def after_sign_in_path_for(resource_or_scope)
      dashboards_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
    end
  end

  def set_current_user_role
    # binding.pry
    @current_user_role = current_user.roles.last.name if current_user.present?
  end
  
end
