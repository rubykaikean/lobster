class DashboardController < ApplicationController
  before_action :authenticate_admin_and_user!
  
  def index
    redirect_to supermin_board_path and return if is_super_admin?
    
    # if is_top_level_admin? || is_top_level_staff? || is_top_level_supervisor?
    #   @company = current_user.company
    #   @projects_count = @company.projects.count
    #   products        = @company.products
    #   @products_count = products.count
      
    #   confirmed_sales = []
    #   products.each do |product|
    #     confirmed_sales << product.sales.confirmed
    #   end
    #   confirmed_sales.flatten!
    #   @sales_count    = confirmed_sales.count
    #   @earnings       = confirmed_sales.inject(0) { |sum, sale| sum + sale.actual_price }

    #   if @company.is_developer?
    #     @agency_count = @company.agencies.count
    #     @agent_count = 0
    #     @company.agencies.each do |agency|
    #       @agent_count += agency.users.count
    #     end
    #   else
    #     @saleman_count = @company.users.count
    #   end

    # else
    #   @company = current_user.company
    #   @agent_count = @company.users.count
    #   parent_company = Company.find @company.parent_id
    #   @projects_count = parent_company.projects.count
    #   products        = parent_company.products
    #   @products_count = products.count

    #   confirmed_sales = []
    #   products.each do |product|
    #     confirmed_sales << product.sales.where("user_id IN (?)", @company.user_ids).to_a
    #   end
    #   confirmed_sales.flatten!
    #   @sales_count    = confirmed_sales.count
    #   @earnings       = confirmed_sales.inject(0) { |sum, sale| sum + sale.actual_price }
    # end
  end
end
