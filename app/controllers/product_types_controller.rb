class ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /product_types
  # GET /product_types.json
  def index
    @product_types = ProductType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_types }
    end
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_type }
    end
  end

  # GET /product_types/new
  def new
    @product_type = ProductType.new
  end

  # GET /product_types/1/edit
  def edit
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)
    
    respond_to do |format|
      if @product_type.save
        format.html { redirect_to phase_path(params[:phase_id]), notice: 'Product type was successfully created.' }
        format.json { render json: @product_type, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        format.html { redirect_to @product_type, notice: 'Product type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type.destroy
    respond_to do |format|
      format.html { redirect_to product_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :description, :product_id)
    end
end
