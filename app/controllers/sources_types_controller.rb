class SourcesTypesController < ApplicationController
  # before_action :authenticate_admin!
  before_action :set_sources_type, only: [:show, :edit, :update, :destroy]

  # GET /sources_types
  # GET /sources_types.json
  def index
    @sources_types = SourcesType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources_types }
    end
  end

  # GET /sources_types/1
  # GET /sources_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sources_type }
    end
  end

  # GET /sources_types/new
  def new
    @sources_type = SourcesType.new
  end

  # GET /sources_types/1/edit
  def edit
  end

  # POST /sources_types
  # POST /sources_types.json
  def create
    @sources_type = SourcesType.new(sources_type_params)

    respond_to do |format|
      if @sources_type.save
        format.html { redirect_to :back, notice: 'Sources type was successfully created.' }
        format.json { render json: @sources_type, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @sources_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources_types/1
  # PATCH/PUT /sources_types/1.json
  def update
    respond_to do |format|
      if @sources_type.update(sources_type_params)
        format.html { redirect_to @sources_type, notice: 'Sources type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sources_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources_types/1
  # DELETE /sources_types/1.json
  def destroy
    @sources_type.destroy
    respond_to do |format|
      format.html { redirect_to sources_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sources_type
      @sources_type = SourcesType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sources_type_params
      params.require(:sources_type).permit(:name, :product_id)
    end
end
