class RegistrationsController < Devise::RegistrationsController
  layout "devise"

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

    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def company_params
      params.require(:company).permit(:name, :registration_number, :address, :phone_number, :fax_number, :type_id, :slug)
  end

end