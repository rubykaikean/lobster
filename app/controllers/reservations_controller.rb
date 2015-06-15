class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(company_id: current_user.company_id, is_published: true)
  end

  def show
    product = Product.friendly.find params[:id]
    @lots = product.lots.order(:name)

  end

  def book_lot
  	# render :text => params
  	lot = Lot.find(params[:id])
  	lot.status_id = 2
  	lot.save!
  	redirect_to :back, notice: "Lot Booked successfully."
  end


end
