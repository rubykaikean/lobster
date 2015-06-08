class RegistrationsController < Devise::RegistrationsController

	def new
		@company = Company.new
    self.resource = User.new
  end

  def create
  	# render :text => params
  	user = User.new(sign_up_params)
		company = Company.new(company_params)
		company.type_id = params[:type_id]

		self.resource = user
		if company.save
			user.company_id = company.id
			if user.save 
				sign_up(resource_name, resource)
				redirect_to root_url, notice: "Successfully Created"
			else
				logger.info {resource.errors.full_messages}
				flash[:alert] = "#{resource.errors.full_messages}"
				render :action => "new"
			end
		else
			logger.info "Error company message"
			flash[:alert] = "Errors.."
			render :action => "new"
		end
  end

  private

  def company_params
      params.require(:company).permit(:name, :registration_number, :address, :phone_number, :fax_number, :type_id, :slug)
  end

end