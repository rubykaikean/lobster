class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(company_id: current_user.company_id, is_published: true)
  end

  def show
    product = Product.friendly.find params[:id]
    @lots = product.lots.order(:name)
  end

  def new
    # render :text => params
    @lot = Lot.friendly.find(params[:lot_id])

  end

  def create_lot
  	render :text => buyer_params
    # @lot = Lot.find(buyer_params[:lot_id])
    # @lot.create_buyer_sale(buyer_params)
    redirect_to reservation_path(buyer_params[:lot_id])
  end


  private

  def buyer_params
    params.require(:buyer).permit!
  end

end
