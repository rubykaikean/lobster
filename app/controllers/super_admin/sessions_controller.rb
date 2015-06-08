class SuperAdmin::SessionsController < Devise::SessionsController
	prepend_before_action :require_no_authentication, only: [ :new, :create ]
	before_action :configure_permitted_parameters
  # skip_before_action :verify_authenticity_token
  layout "devise"

  def create
  	#render :text => sign_in_params
    super do |resource|
      # do some other job

    end
  end

  def destroy
    super do |resource|
      # do some other job
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password)
    end
  end

end