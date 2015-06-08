class DashboardController < ApplicationController
  before_action :authenticate_admin_and_user!
  
  def index
  end
end
