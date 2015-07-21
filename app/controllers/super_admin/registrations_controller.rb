class SuperAdmin::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout "application"

	def new
		# @company = Company.new
    # self.resource = User.new
    # raise ActiveRecord::RecordNotFound
    raise ActionController::RoutingError.new('Not Found')
  end

  def create
  	# render :text => params
    # user = User.new(sign_up_params)
		# @company = Company.new(company_params)
		# @company.type_id = params[:type_id]

		# self.resource = user
		# if @company.save
		# 	user.company_id = @company.id
		# 	if user.save 
		# 		sign_up(resource_name, resource)
		# 		redirect_to root_url, notice: "Successfully sign up."
		# 	else
		# 		logger.info {resource.errors.full_messages}
		# 		flash[:alert] = "#{resource.errors.full_messages}"
		# 		render :action => "new"
		# 	end
		# else
		# 	flash[:alert] = "Errors.."
		# 	render :action => "new"
		# end
    raise ActionController::RoutingError.new('Not Found')
  end

  def edit
    self.resource = current_admin
    # raise ActionController::RoutingError.new('Not Found')
  end

  private

  def after_update_path_for(resource)
    edit_admin_registration_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :display_name, :contact_number, :password, :password_confirmation, :current_password)
    end
  end

end