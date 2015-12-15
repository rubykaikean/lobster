class ReservationsController < ApplicationController
  # before_action :authenticate_reservation!, only: [:show]
  before_action :authenticate_user!

  def index

    company = current_user.company
    linkage = CompanyProductsLinkage.where("company_id = ?", current_user.company_id)
    # product_id = linkage.map(&:product_id).join(', ')
    product_id = linkage.map(&:product_id)
    if company.parent_id.to_i > 0
      # check parent company id
      @products = Product.where("company_id = ? OR id IN (?) AND is_published = ?", current_user.company.parent_id, product_id, true)
      # check self
    else
      # check self id
      @products = Product.where("company_id = ? OR id IN (?) AND is_published = ?", current_user.company_id, product_id, true)
      # render :text => @products.to_json
    end
    
    # linkage.each do |p|
    #   @linkage_products << Product.find_by(id: p.product_id).map(&:inspect).join(', ')
    # end
    # # check company_product_linage
    # # check other product id then self compeny id, append to @products
  end

  def show
    @product = Product.friendly.find params[:id]
    @lots = @product.lots.order("row_key, name").group_by {|lot| lot.row_key }
    @setting = @product.product_setting
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

  # confirm booking and hide book unit button
  def confirm_reservation
    SaleConfirmReservation.new(params[:sale_id]).sale_confirm_and_pending_reservation
    redirect_to sales_path
  end

  def create_lot
    @lot = Lot.find(params[:lot_id])
    @sourcestype = @lot.product.sources_types
    @region = @lot.product.regions
    @setting = @lot.product.product_setting
    if UserAccessible.new(current_user, :reservation, :reserve).can_access?
      data = { 
        lot: @lot, 
        setting: @setting,
        buyer_data: buyer_params,
        payment_type_id: params[:payment_type_id],
        booking_fee: params[:booking_fee],
        payment_image: params[:payment_image],
        user_id: params[:user_id]
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
