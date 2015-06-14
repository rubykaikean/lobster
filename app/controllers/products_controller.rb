class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = current_user.company.products

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_type = ProductType.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  def new
    @phase = Phase.find(params[:id])
    @product = @phase.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    
    @product = Product.new(product_params)
    @product.status_id = Product::AVAILABLE
    respond_to do |format|
      if @product.save
        format.html { redirect_to phase_path(@product.phase), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created }
      else
        format.html { 
          flash.now[:alert] =  @product.errors.full_messages.join("<br>")
          render action: 'new'
           }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          flash.now[:alert] =  @product.errors.full_messages.join("<br>")
          render action: 'edit' 
        }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # render :text => params
    phase = @product.phase
    @product.destroy
    respond_to do |format|
      format.html { redirect_to phase_path(phase) }
      format.json { head :no_content }
    end
  end


  def create_lot
    # render :text => lot_params
    @product = Product.find(lot_params[:product_id])
    @product.auto_create_lot(lot_params)
    redirect_to product_path(@product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :type_id, :description, :status_id, :phase_id)
    end

    def lot_params
      params.require(:product).permit!
    end
   
end
