class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  # GET /lots
  # GET /lots.json
  def index
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
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:name, :description, :product_id)
    end
end
