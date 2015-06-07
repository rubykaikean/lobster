class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!


  def is_super_admin?
    unless current_user.is_super_admin?
      flash[:alert] = "Only Super Admin can access the section."
      redirect_to root_url
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation, :current_password) }
  end

end
