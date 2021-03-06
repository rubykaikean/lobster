class PhasesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :set_phase, only: [:show, :edit, :update, :destroy]

  # GET /phases
  # GET /phases.json
  def index
    @phases = Phase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phases }
    end
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
    @product = Product.new
    @product_list = Product.where("phase_id = ?", @phase.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phase }
    end
  end

  # GET /phases/new
  def new
    @phase = Phase.new
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  # POST /phases.json
  def create
    @phase = Phase.new(phase_params)
    @phase.status_id = Phase::AVAILABLE
    respond_to do |format|
      if @phase.save
        format.html { redirect_to project_path(@phase.project), notice: 'Phase was successfully created.' }
        format.json { render json: @phase, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase, notice: 'Phase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    # render :text => params
    project = @phase.project
    status, message = @phase.try_to_destroy
    if status
      @phase.destroy
    else
      flash[:alert] = message
    end

    respond_to do |format|
      format.html { redirect_to project_path(project) }
      format.json { head :no_content }
    end
  end

  def update_product
    # render :text => product_phase_params
    product_phase_params.each do |id, content|
      product = Product.find id
      product.name = content[:name]
      product.type_id = content[:type_id]
      product.status_id = content[:status_id]
      product.is_published = content[:is_published]
      product.company_id = current_user.company_id if product.company_id.blank?
      product.save!
    end
    redirect_to :back, notice: "Product update successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase
      @phase = Phase.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_params
      params.require(:phase).permit(:name, :description, :status_id, :project_id, :no_phase)
    end

    def product_phase_params
      params.require(:product).permit!
    end
end
