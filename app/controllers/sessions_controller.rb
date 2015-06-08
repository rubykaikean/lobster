class SessionsController < Devise::SessionsController
	prepend_before_filter :require_no_authentication, only: [ :new, :create ]
	#before_filter :configure_permitted_parameters, if: :devise_controller?
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

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_in) do |u|
  #     u.permit(:login, :email, :password)
  #   end
  # end

end