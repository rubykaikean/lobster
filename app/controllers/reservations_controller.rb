class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorize, only: [:index, :show]

  def index
    company = current_user.company
    if company.is_developer?
      
      @products = Product.where(id: @authorize_product_id, company_id: current_user.company_id, is_published: true).order(:name)
    else
      if company.parent_id.to_i > 0
        @products = Product.where(id: @authorize_product_id, company_id: current_user.company.parent_id, is_published: true).order(:name)
      else
        @products = Product.where(id: @authorize_product_id, company_id: current_user.company_id, is_published: true).order(:name)
      end
    end
  end



  def show
    @product = Product.friendly.find params[:id]
    @lots = @product.lots.order("row_key, name").group_by {|lot| lot.row_key }
    @setting = @product.product_setting
  end

  def buyer
    # render :text => params
    # # logger.info {"testing by admin"}
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
    sale = Sale.find(params[:sale_id])
    buyer_params = Buyer.find(sale.buyer_id)
    setting = sale.lot.product.product_setting
    # # render :text => sale.to_json
    data = {
      sale: sale,
      lot: sale.lot,
      setting: setting,
      buyer_data: buyer_params
    }
    if current_user.company_id.to_i == 9
      CustomSaleEngine.prebook(data)
    end
    SaleConfirmReservation.new(params[:sale_id]).sale_confirm_and_pending_reservation
    redirect_to sales_path
  end

  def create_lot
    # render :text => buyer_params
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
        cheque_number: params[:cheque_number],
        transaction_number: params[:transaction_number],
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

  def check_authorize
    @authorize_product_id = []
    authorize = AuthorizeProductUser.where(user_id: current_user.id)
    authorize.each do |p|
      @authorize_product_id << p.product_id
    end
  end

  def llk_developer_params
    params.require(:customize).permit(:transaction_id, :full_name, :buyer_second_name, :buyer_third_name, :buyer_ic_number, :second_buyer_ic_number, :third_buyer_ic_number, :buyer_address, :buyer_postcode, :booking_fee, :car_park_unit, :payment_type, :lot_number, :selling_price, :cheque_number, :credit_card_number, :buyer_fouth_address)
  end

  def buyer_params
    params.require(:buyer).permit!
  end

end
