class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(company_id: current_user.company_id, is_published: true)
  end

  def show
    @product = Product.friendly.find params[:id]
    @lots = @product.lots.order("row_key, name").group_by {|lot| lot.row_key }
  end

  def buyer
    # render :text => params
    @sourcestype = SourcesType.all
    @region = Region.all
    @lot = Lot.friendly.find(params[:id])
    if @lot.is_available?
      @lot.status_id = Lot::RESERVED
      @lot.save
      @sale = Sale.new
      @sale.lot_unit_id = @lot.id
      @sale.product_id = @lot.product_id
      @sale.phase_id = @lot.product.phase_id
      @sale.project_id = @lot.product.phase.project_id
      @sale.user_id = current_user.id
      @buyer = Buyer.create
      @sale.buyer_id = @buyer.id
      @sale.status_id = 1
      @sale.save
    else
      flash[:alert] = "Lot #{@lot.name} is not available for booking."
      redirect_to reservation_path(@lot.product)
    end
  end

  def create_lot
    # render :text => params[:buyer][:race]
    @lot = Lot.find(params[:lot_id])
    buyer = Buyer.friendly.find(params[:id])
    buyer.update(buyer_params)
    sale = Sale.find(params[:sale_id])
    
    sale.update(booking_fee: params[:booking_fee])
    flash[:notice] = "Lot #{@lot.name} has been reserved successfully for #{buyer.full_name}."
    redirect_to reservation_path(@lot.product)
  end


  private

  def buyer_params
    params.require(:buyer).permit!
  end

end
