class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    company = current_user.company
    if company.is_developer?
      @products = Product.where(company_id: current_user.company_id, is_published: true)
    else
      if company.parent_id.to_i > 0
        @products = Product.where(company_id: current_user.company.parent_id, is_published: true)
      else
        @products = Product.where(company_id: current_user.company_id, is_published: true)
      end
    end
  end

  def show
    @product = Product.friendly.find params[:id]
    @lots = @product.lots.order("row_key, name").group_by {|lot| lot.row_key }
  end

  def buyer
    # render :text => params
    @lot = Lot.friendly.find(params[:id])
    if UserAccessible.new(current_user, :reservation, :reserve).can_access?
      @sourcestype = @lot.product.sources_types
      @region = @lot.product.regions
      if @lot.available_for_booking?
        @buyer = Buyer.new
        @sale = Sale.new
      else
        flash[:alert] = "Lot #{@lot.name} is not available for booking."
        redirect_to reservation_path(@lot.product)
      end
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to reservation_path(@lot.product)
    end
  end

  def create_lot
    # render :text => params[:buyer][:race]
    @lot = Lot.find(params[:lot_id])
    @sourcestype = @lot.product.sources_types
    @region = @lot.product.regions
    if UserAccessible.new(current_user, :reservation, :reserve).can_access?
      @buyer = Buyer.new(buyer_params)
      if @buyer.save
        @lot.status_id = Lot::RESERVED
        @lot.save
        @sale = Sale.new
        @sale.lot_unit_id = @lot.id
        @sale.product_id = @lot.product_id
        @sale.phase_id = @lot.product.phase_id
        @sale.project_id = @lot.product.phase.project_id
        @sale.user_id = current_user.id
        @sale.buyer_id = @buyer.id
        @sale.booking_fee = params[:booking_fee]
        @sale.status_id = Sale::PENDING
        @sale.save
        flash[:notice] = "Lot #{@lot.name} has been reserved successfully for #{@buyer.full_name}."
        redirect_to reservation_path(@lot.product)
      else
        flash.now[:alert] =  @buyer.errors.full_messages.join("<br>")
        render action: 'buyer'
      end
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to reservation_path(@lot.product)
    end
  end


  private

  def buyer_params
    params.require(:buyer).permit!
  end

end
