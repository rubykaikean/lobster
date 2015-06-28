class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_suspended_user!, unless: :devise_controller?

  # before_action :authenticate_user!
  # before_action :authenticate_admin!

  protected

  helper_method :authenticate_suspended_user!
  def authenticate_suspended_user!
    if current_user && current_user.is_suspended?
      flash[:alert] = "You account has been suspended."
      sign_out(current_user)
    end
  end

  helper_method :is_super_admin?
  def is_super_admin?
    admin_signed_in? && current_admin
  end

  helper_method :is_top_level_admin?
  def is_top_level_admin?
    if current_user && current_user.company.parent_id.to_i == 0
      current_user.is_admin?
    else
      return false
    end
  end

  helper_method :is_top_level_staff?
  def is_top_level_staff?
    if current_user && current_user.company.parent_id.to_i == 0
      current_user.is_staff?
    else
      return false
    end
  end

  helper_method :is_top_level_management?
  def is_top_level_management?
    is_top_level_admin? || is_top_level_staff?
  end

  helper_method :is_low_level_admin?
  def is_low_level_admin?
    if current_user && current_user.company.parent_id.to_i > 0
      current_user.is_admin?
    else
      return false
    end
  end

  helper_method :is_low_level_staff?
  def is_low_level_staff?
    if current_user && current_user.company.parent_id.to_i > 0
      current_user.is_staff?
    else
      return false
    end
  end

  helper_method :is_low_level_management?
  def is_low_level_management?
    is_low_level_admin? || is_low_level_staff?
  end

  def authenticate_admin_and_user!
    unless user_signed_in? || admin_signed_in?
      flash[:alert] = "You need to sign in first before continue."
      return redirect_to new_user_session_path
    end
  end

  def authenticate_super_admin!
    unless admin_signed_in?
      flash[:alert] = "You need to sign in as supermin before continue."
      return redirect_to new_admin_session_path
    end
  end

  def authenticate_project_owner!
    company = current_user.company
    if company.type_id == Company::DEVELOPER
      unless current_user.type_id == User::ADMIN
        flash[:alert] = "You need to sign in as an admin before continue."
        return redirect_to root_path
      end
    else
      if company.parent_id.to_i > 0
        flash[:alert] = "You need to sign in as a developer admin before continue."
        return redirect_to root_path
      else
        unless current_user.type_id == User::ADMIN
          flash[:alert] = "You need to sign in as an admin before continue."
          return redirect_to root_path
        end
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:display_name, :email, :type_id, :company_id, :password, :password_confirmation, :current_password) }
  end

end
