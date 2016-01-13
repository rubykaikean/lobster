class ProductSettingsController < ApplicationController
  before_action :set_product_setting, only: [:show, :edit, :update, :destroy]

  # GET /product_settings
  # GET /product_settings.json
  def index
    @product_settings = ProductSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_settings }
    end
  end

  # GET /product_settings/1
  # GET /product_settings/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_setting }
    end
  end

  # GET /product_settings/new
  def new
    @product_setting = ProductSetting.new
  end

  # GET /product_settings/1/edit
  def edit
  end

  # POST /product_settings
  # POST /product_settings.json
  def create
    @product_setting = ProductSetting.new(product_setting_params)

    respond_to do |format|
      if @product_setting.save
        format.html { redirect_to @product_setting, notice: 'Product setting was successfully created.' }
        format.json { render json: @product_setting, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_settings/1
  # PATCH/PUT /product_settings/1.json
  def update
    respond_to do |format|
      if @product_setting.update(product_setting_params)
        format.html { redirect_to @product_setting, notice: 'Product setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_settings/1
  # DELETE /product_settings/1.json
  def destroy
    @product_setting.destroy
    respond_to do |format|
      format.html { redirect_to product_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_setting
      @product_setting = ProductSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_setting_params
      params.require(:product_setting).permit(:allow_multiple_booking, :bumi_putera_discount_rate, :notify_admin_on_payment_upload)
    end
end
