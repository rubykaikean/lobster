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
      @product = @lot.product
      @sourcestype = @product.sources_types
      @region = @product.regions
      @setting = @product.product_setting
      @customization = @product.reservation_customization
      if @lot.available_for_booking?
        @buyer = Buyer.new
        @sale = Sale.new
      else
        flash[:alert] = "Lot #{@lot.name} is already reserved."
        redirect_to reservation_path(@lot.product)
      end
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to reservation_path(@lot.product)
    end
  end

  def create_lot
    # render :text => params[:buyer]
    @lot = Lot.find(params[:lot_id])
    @sourcestype = @lot.product.sources_types
    @region = @lot.product.regions
    @setting = @lot.product.product_setting
    if UserAccessible.new(current_user, :reservation, :reserve).can_access?
      data = { 
        lot: @lot, 
        setting: @setting,
        buyer_data: buyer_params,
        booking_fee: params[:booking_fee],
        payment_image: params[:payment_image],
        user_id: current_user.id
      }
      result = SaleEngine.reserve(data)
      case result[:status]
      when 201
        flash[:notice] = result[:message]
        redirect_to reservation_path(@lot.product)
      when 403
        flash[:alert] = result[:message]
        redirect_to reservation_path(@lot.product)
      when 400
        flash.now[:alert] = result[:message]
        @buyer = result[:buyer]
        @sale = result[:sale]
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
