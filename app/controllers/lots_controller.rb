class LotsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  # GET /lots
  # GET /lots.json
  def index
    @product = Product.find(params[:product_id])
    @lots = Lot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lots }
    end
  end

  # GET /lots/1
  # GET /lots/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lot }
    end
  end

  # GET /lots/new
  def new
    @lot = Lot.new
  end

  # GET /lots/1/edit
  def edit
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)

    respond_to do |format|
      if @lot.save
        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render json: @lot, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    # render :text => params

    sale = Sale.pluck(:lot_unit_id)
    if sale.any? {|a| a == @lot.id }
      flash[:alert] = "The Lot cannot be delete because it has Sale attached. "
     else
      @lot.destroy
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def bulk_update
    # render :text => params
    product = Product.friendly.find(params[:id])
    update_lot_params.each do |id, content|
      lot = Lot.find id
      lot.name = content[:name]
      lot.display_name = content[:display_name]
      lot.is_special_unit = content[:is_special_unit]
      lot.row_key = content[:row_key]
      lot.selling_price = content[:selling_price]
      lot.product_type_id = content[:product_type_id]
      if content[:status_id].to_i == Lot::BLOCKED
        lot.status_id = content[:status_id] if lot.is_available?
      else
        lot.status_id = content[:status_id]
      end
      lot.save
    end
    # redirect_to "#{product_path(product)}#lot-tab", notice: "Lot update successfully."
    redirect_to :back, notice: "Lot update successfully."
  end

  def book_lot
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:name, :description, :product_id, :land_area_square_meter, :land_area_square_feet, :extra_land_square_meter, :extra_land_square_feet, :premium, :extra_land_price, :selling_price, :is_special_unit, :display_name)
    end

    def update_lot_params
      params.require(:update_lot).permit!
    end
end
