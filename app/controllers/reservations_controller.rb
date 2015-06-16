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

  	# render :text => params[:buyer][:lot_id]
    @lot = Lot.find(buyer_params["lot_id"])
    @lot.create_buyer(buyer_params, current_user.id)
    @lot.status_id = 2
    @lot.save!
    redirect_to reservation_path(@lot.product)
    flash[:notice] = "Lot has been reserved"
  end


  private

  def buyer_params
    params.require(:buyer).permit!
  end

end
