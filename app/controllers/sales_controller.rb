class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!, except: [:index, :edit, :confirm_sales, :reject_sales]
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    return redirect_to root_path, alert: "Sorry, you don't have the access right." if is_low_level_staff?
    if is_top_level_management?
      @q = Sale.where("product_id IN(?)", current_user.company.product_ids).ransack(params[:q])
    else
      @q = current_user.sales.ransack(params[:q])
    end
    @sales = @q.result(distinct: true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @sale }
    # end
  end

  # GET /sales/new
  def new
    # @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    unless is_top_level_admin?
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

  def confirm_sales
    # render :text => confirm_sale_params
    if is_top_level_management?
      Sale.confirm_sale(confirm_sale_params)
      redirect_to sales_path, notice: "Sale has been confirmed."
    else
      flash[:alert] = "Sorry, you don't have the access right."
      redirect_to sales_path
    end
  end

  def reject_sales
    # render :text => confirm_sale_params
    if is_top_level_management?
      s = Sale.find(confirm_sale_params[:sale_id])
      s.status_id = Sale::REJECTED
      s.reject_reason = confirm_sale_params[:reject_reason]
      if s.save
        lot = Lot.find(s.lot_unit_id)
        lot.status_id = Lot::AVAILABLE
        lot.save
      end
      redirect_to sales_path, notice: "Sale has been rejected."
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :downpayment, :downpayment_percentage ,:downpayment_type, :bank_loan, :spa)
    end

    def confirm_sale_params
      params.require(:sale).permit!
    end
end
