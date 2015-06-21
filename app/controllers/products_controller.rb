class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :site_plans, :floor_plans]
  
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
    @product_types = @product.product_types

    @product_type = ProductType.new
    @setting = @product.product_setting

    @email = @product.email_setting

    @q = @product.lots.ransack(params[:q])
    @lots = @q.result(distinct: true)
    
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
    @product.company_id = current_user.company_id
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

  def site_plans
    @plans = @product.site_plans
  end

  def floor_plans
    @plans = @product.floor_plans
  end


  def create_lot
    # render :text => lot_params
    @product = Product.find(lot_params[:product_id])
    @product.auto_create_lot(lot_params)
    flash[:notice] = "Lots has been generated successfully."
    redirect_to product_path(@product)
  end

  def update_setting
    setting = ProductSetting.find(params[:id])
    setting.update(setting_params)
    flash[:notice] = "Setting has been saved."
    # redirect_to "#{product_path(setting.product)}#product_setting-tab"
    redirect_to :back
  end

  def update_email_setting
    email_setting = EmailSetting.find(params[:id])
    email_setting.update(setting_email_params)
    flash[:notice] = "Email Setting has been saved."
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :type_id, :description, :status_id, :phase_id, :e_brochure_url)
    end

    def lot_params
      params.require(:product).permit!
    end

    def setting_params
      params.require(:setting).permit(:unit_per_row, :bumi_putera_discount_rate)
    end

    def setting_email_params
      params.require(:setting_email).permit!
    end
   
end
