class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!
  # before_action :authenticate_admin!

  protected

  helper_method :is_super_admin?
  def is_super_admin?
    admin_signed_in? && current_admin
  end

  helper_method :current_user_is_admin?
  def current_user_is_admin?
    if user_signed_in?
      current_user.is_admin?
    else
      false
    end
  end

  def authenticate_admin_and_user!
    unless user_signed_in? || admin_signed_in?
      flash[:alert] = "You need to sign in first before continue."
      redirect_to new_user_session_path
    end
  end

  def authenticate_super_admin!
    unless admin_signed_in?
      flash[:alert] = "You need to sign in as supermin before continue."
      redirect_to new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation, :current_password) }
  end

end
