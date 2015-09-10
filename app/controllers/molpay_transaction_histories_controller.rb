class MolpayTransactionHistoriesController < ApplicationController
  before_action :set_molpay_transaction_history, only: [:show, :edit, :update, :destroy]

  # GET /molpay_transaction_histories
  # GET /molpay_transaction_histories.json
  def index
    @molpay_transaction_histories = MolpayTransactionHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @molpay_transaction_histories }
    end
  end

  # GET /molpay_transaction_histories/1
  # GET /molpay_transaction_histories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @molpay_transaction_history }
    end
  end

  # GET /molpay_transaction_histories/new
  def new
    @molpay_transaction_history = MolpayTransactionHistory.new
  end

  # GET /molpay_transaction_histories/1/edit
  def edit
  end

  # POST /molpay_transaction_histories
  # POST /molpay_transaction_histories.json
  def create
    @molpay_transaction_history = MolpayTransactionHistory.new(molpay_transaction_history_params)

    respond_to do |format|
      if @molpay_transaction_history.save
        format.html { redirect_to @molpay_transaction_history, notice: 'Molpay transaction history was successfully created.' }
        format.json { render json: @molpay_transaction_history, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @molpay_transaction_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /molpay_transaction_histories/1
  # PATCH/PUT /molpay_transaction_histories/1.json
  def update
    respond_to do |format|
      if @molpay_transaction_history.update(molpay_transaction_history_params)
        format.html { redirect_to @molpay_transaction_history, notice: 'Molpay transaction history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @molpay_transaction_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /molpay_transaction_histories/1
  # DELETE /molpay_transaction_histories/1.json
  def destroy
    @molpay_transaction_history.destroy
    respond_to do |format|
      format.html { redirect_to molpay_transaction_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_molpay_transaction_history
      @molpay_transaction_history = MolpayTransactionHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def molpay_transaction_history_params
      params.require(:molpay_transaction_history).permit(:amount, :is_paid, :status, :bill_name, :bill_email, :bill_mobile, :bill_desc, :tran_id, :domain, :currency, :paydate, :order_id, :appcode, :error_code, :error_desc, :channel, :sale_id)
    end
end
