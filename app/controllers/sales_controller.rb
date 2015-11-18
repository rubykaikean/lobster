class SalesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authenticate_project_owner!, except: [:index, :edit, :confirm_sales, :reject_sales, :new_payment, :add_payment]
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :new_payment, :add_payment]

  # GET /sales
  # GET /sales.json
  def index
    return redirect_to root_path, alert: "Sorry, you don't have the access right." if is_low_level_staff?
    if is_middle_level_management?
      @agencies = []
      @agencies << current_user.company.agencies
      @agencies << current_user.company
      @agencies.flatten!
      @q = Sale.where("product_id IN(?)", current_user.company.product_ids).order("created_at DESC").ransack(params[:q])
    else
      @q = current_user.sales.ransack(params[:q])
    end
    @sales = @q.result(distinct: true).order("id ASC").page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  def export_purchaser_excel
    @sales = Sale.where("product_id IN(?)", current_user.company.product_ids).order("created_at DESC")
    # @ideal_export_excel = DeveloperCustomer.where("remark = 'ideal'")
    respond_to do |format|
      format.csv { render text: @sales.to_csv }
      format.xls
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @payments =  @sale.payments
    render action: 'show', layout: false
  end

  # GET /sales/new
  def new
    # @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    
    unless is_top_level_management?
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to sales_path
    end
  end

  # POST /sales
  # POST /sales.json
  def create
    # @sale = Sale.new(sale_params)

    # respond_to do |format|
    #   if @sale.save
    #     format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
    #     format.json { render json: @sale, status: :created }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @sale.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sales_path, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    # @sale.destroy
    # respond_to do |format|
    #   format.html { redirect_to sales_url }
    #   format.json { head :no_content }
    # end
  end

  def new_payment
    @molpay_transaction = MolpayTransactionHistory.find_by(sale_id: @sale.id)
    # render :text => @sale.id.to_json
    unless @sale.user_id == current_user.id
      flash[:alert] = "Only the agent of the sale can edit."
      redirect_to sales_path
    end
  end

  def add_payment
    if @sale.user_id == current_user.id
      if params[:payment_image]
        params[:payment_image].each do |file|
          if !file.nil?
            payment = @sale.payments.new
            payment.image = file
            payment.save
          end
        end
      end
    @sale.cheque_number = params[:payment][:cheque_number] if params[:payment][:cheque_number]
    @sale.transaction_number = params[:payment][:transaction_number] if params[:payment][:transaction_number]
    @sale.save
    else
      flash[:alert] = "Only the agent of the sale can edit."
    end
    redirect_to sales_path
  end

  def confirm
    if is_top_level_management?
      @sale = Sale.find params[:id]
      SaleEngine.new(@sale, sale_params).confirm
      #@sale.confirm_sale(confirm_sale_params)
      redirect_to sales_path, notice: "Sale has been confirmed."
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to sales_path
    end
  end


  def reject
    sale = Sale.find(params[:id])
    if is_top_level_management? || sale.user_id == current_user.id
      SaleEngine.new(sale, reject_reason_params).reject
      redirect_to sales_path, notice: "Sale has been rejected successfully."
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to sales_path
    end
  end

  def cancel
    sale = Sale.find(params[:id])
    if is_top_level_management? || sale.user_id == current_user.id
      if sale.status_id == Sale::COMPLETED
        SaleEngine.new(sale, cancel_reason_params).cancel
        flash[:notice] = "Sale has been cancelled successfully."
      else
        flash[:alert] = "The sale cannot be cancel due to invalid status."
      end
      redirect_to sales_path
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to sales_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def llk_developer_params
      params.require(:customize).permit(:transaction_id, :full_name, :buyer_second_name, :buyer_third_name, :buyer_ic_number, :second_buyer_ic_number, :third_buyer_ic_number, :buyer_address, :buyer_postcode, :booking_fee, :car_park_unit, :payment_type, :lot_number, :selling_price, :cheque_number, :credit_card_number)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:admin_confirm_user_id ,:user_id, :downpayment, :downpayment_percentage, :payment_type_id, :cash, :bank_loan, :government_loan, :staff_loan , :spa, :confirm_date, :purchaser_name, :purchaser_address, :purchaser_ic_number, :purchaser_contact_number, :cancel_date, :cheque_number, :transaction_number)
    end

    def reject_reason_params
      params.require(:sale).permit(:reject_reason)
    end

    def cancel_reason_params
      params.require(:sale).permit(:cancel_reason)
    end
end
