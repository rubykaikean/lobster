class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  # GET /buyers
  # GET /buyers.json
  def index
    @buyers = Buyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buyers }
    end
  end

  # GET /buyers/1
  # GET /buyers/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buyer }
    end
  end

  # GET /buyers/new
  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
    @sale = Sale.find(params[:sale_id])
    @region = current_user.company.regions
    @sourcestype = current_user.company.sources_types
  end

  # POST /buyers
  # POST /buyers.json
  def create
    @buyer = Buyer.new(buyer_params)

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to @buyer, notice: 'Buyer was successfully created.' }
        format.json { render json: @buyer, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    @sale = Sale.find(params[:sale_id])
    @sale.update(:booking_fee => params[:booking_fee])
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to sales_path, notice: 'Buyer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          @region = current_user.company.regions
          @sourcestype = current_user.company.sources_types
          render action: 'edit' }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1
  # DELETE /buyers/1.json
  def destroy
    @buyer.destroy
    respond_to do |format|
      format.html { redirect_to buyers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_params
      params.require(:buyer).permit(:full_name, :ic_number, :address, :mobile_contact_number, :home_contact_number, :office_contact_number, :email, :status_id, :gender, :age, :region_id, :race, :sources_type_id)
    end
end
