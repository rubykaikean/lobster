class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @q = Sale.ransack(params[:q])
    @sales = @q.result(distinct: true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
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
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  def confirm_sales
    # render :text => confirm_sale_params
    Sale.confirm_sale(confirm_sale_params)
    redirect_to sales_path, :notice => "Setting successfully updated"
  end

  def reject_sales
    # render :text => confirm_sale_params
    s = Sale.find(confirm_sale_params[:sale_id])
    s.status_id = 3
    s.reject_reason = confirm_sale_params[:reject_reason]
    s.save!
    redirect_to sales_path, :notice => "Setting successfully updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:project_id, :product_id, :lot_unit_id, :phase_id, :user_id, :status_id, :downpayment, :downpayment_percentage ,:down_payment_type, :cash_bank_loan, :spa, :reject_reason)
    end

    def confirm_sale_params
      params.require(:sale).permit!
    end
end
