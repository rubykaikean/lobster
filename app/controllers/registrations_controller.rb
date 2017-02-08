class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout "devise", only: [:new]
  # layout "application"

	def new
    # render :text => params
		# @company = Company.new
    self.resource = User.new
    # raise ActiveRecord::RecordNotFound
    # raise ActionController::RoutingError.new('Not Found')
  end

  def create
    # render :text => sign_up_params

    user = User.new(sign_up_params)
    user.status_id = User::INACTIVE
    user.type_id   = User::STAFF
    user.save!
    redirect_to new_user_session_path, :notice => "Thank for signed up"
    
		# @company = Company.new(company_params)
		# @company.type_id = params[:type_id]

    # raise ActionController::RoutingError.new('Not Found')
  end

  def edit
    self.resource = current_user
    # raise ActionController::RoutingError.new('Not Found')
  end

  protected 
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :display_name, :contact_number, :type_id, :company_id, :status_id, :password, :password_confirmation, :current_password)
    end
  end

  # private

  def sign_up_params
    params.require(:user).permit(:email, :display_name, :username, :password, :password_confirmation)
  end
  # def company_params
  #     params.require(:company).permit(:name, :registration_number, :address, :phone_number, :fax_number, :type_id, :slug)
  # end



end