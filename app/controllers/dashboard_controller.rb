class DashboardController < ApplicationController
  before_action :authenticate_admin_and_user!
  
  def index
    redirect_to supermin_board_path and return if is_super_admin?
  end
end
