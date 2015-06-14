class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

    @phase = Phase.where("project_id = ?", @project.id)
    # render :text => @phase.to_json
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    # render :text => params[:project][:no_phase].to_i.class
    @project = Project.new(project_params)
    num_phase = params[:project][:no_phase].to_i
    respond_to do |format|
      if @project.save
        @project.project_create_phase(num_phase)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created }
      else
        format.html { 
          flash.now[:alert] =  @project.errors.full_messages.join("<br>")
          render action: 'new' 
        }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          flash.now[:alert] =  @project.errors.full_messages.join("<br>")
          render action: 'edit' 
        }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    # render :text => params
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def update_phase
    project_phase_params.each do |id, content|
      phase = Phase.find id
      phase.name = content[:name]
      phase.status_id = content[:status_id]
      phase.save!
    end
    redirect_to :back, notice: "Phase update successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :status_id, :company_id)
    end

    def project_phase_params
      params.require(:phase).permit!
    end
end
