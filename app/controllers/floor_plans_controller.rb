class FloorPlansController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :redirect_to_back
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :find_product
  before_action :set_floor_plan, only: [:show, :edit, :update, :destroy]

  # GET /floor_plans
  # GET /floor_plans.json
  def index
    @floor_plans = @product.floor_plans

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @floor_plans }
    end
  end

  # GET /floor_plans/1
  # GET /floor_plans/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @floor_plan }
    end
  end

  # GET /floor_plans/new
  def new
    @floor_plan = @product.floor_plans.new
  end

  # GET /floor_plans/1/edit
  def edit
  end

  # POST /floor_plans
  # POST /floor_plans.json
  def create
    @floor_plan = @product.floor_plans.new(floor_plan_params)

    respond_to do |format|
      if @floor_plan.save
        format.html { redirect_to :back, notice: 'Floor plan was successfully created.' }
        format.json { render json: @floor_plan, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floor_plans/1
  # PATCH/PUT /floor_plans/1.json
  def update
    respond_to do |format|
      if @floor_plan.update(floor_plan_params)
        format.html { redirect_to :back, notice: 'Floor plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floor_plans/1
  # DELETE /floor_plans/1.json
  def destroy
    @floor_plan.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor_plan
      @floor_plan = @product.floor_plans.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_plan_params
      params.require(:floor_plan).permit(:product_id, :image)
    end

    def find_product
      @product = Product.friendly.find(params[:product_id])
    end

    def redirect_to_back
      flash[:alert] = "You have to choose an image to upload."
      redirect_to :back
    end
end
