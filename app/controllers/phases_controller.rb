class PhasesController < ApplicationController
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
    @product = Product.where("phase_id = ?", @phase.id)
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

    respond_to do |format|
      if @phase.save
        format.html { redirect_to @phase, notice: 'Phase was successfully created.' }
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
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to phases_url }
      format.json { head :no_content }
    end
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
end
