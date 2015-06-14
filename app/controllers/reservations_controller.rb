class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(company_id: current_user.company_id, is_published: true)
  end

  def show
  end
end
