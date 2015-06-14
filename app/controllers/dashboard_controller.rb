class DashboardController < ApplicationController
  before_action :authenticate_admin_and_user!
  
  def index
    redirect_to supermin_board_path and return if is_super_admin?
    if current_user
	    @company = current_user.company
	    @setting = @company.company_setting
	  end
  end
end
