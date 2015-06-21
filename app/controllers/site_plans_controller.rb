class SitePlansController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :redirect_to_back
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :find_product
  before_action :set_site_plan, only: [:show, :edit, :update, :destroy]

  # GET /site_plans
  # GET /site_plans.json
  def index
    @site_plans = @product.site_plans

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_plans }
    end
  end

  # GET /site_plans/1
  # GET /site_plans/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_plan }
    end
  end

  # GET /site_plans/new
  def new
    @site_plan = @product.site_plans.new
  end

  # GET /site_plans/1/edit
  def edit
  end

  # POST /site_plans
  # POST /site_plans.json
  def create
    @site_plan = @product.site_plans.new(site_plan_params)

    respond_to do |format|
      if @site_plan.save
        format.html { redirect_to :back, notice: 'Site plan was successfully created.' }
        format.json { render json: @site_plan, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_plans/1
  # PATCH/PUT /site_plans/1.json
  def update
    respond_to do |format|
      if @site_plan.update(site_plan_params)
        format.html { redirect_to :back, notice: 'Site plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_plans/1
  # DELETE /site_plans/1.json
  def destroy
    @site_plan.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_plan
      @site_plan = @product.site_plans.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_plan_params
      params.require(:site_plan).permit(:product_id, :image)
    end

    def find_product
      @product = Product.friendly.find(params[:product_id])
    end

    def redirect_to_back
      flash[:alert] = "You have to choose an image to upload."
      redirect_to :back
    end
end
