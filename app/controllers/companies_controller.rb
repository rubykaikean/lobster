class CompaniesController < ApplicationController
  before_action :authenticate_super_admin!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

    # @company_setting = CompanySetting.where("company_id = ?", params[:id]).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
    @user = User.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.type_id = params[:company_type_id]

    @user = User.new(email: params[:company_email], password: params[:company_password], password_confirmation: params[:company_password_confirmation], display_name: "Admin")

      if @company.valid? && @user.valid?
        if @company.save
          @user.company_id = @company.id
          @user.save!
          redirect_to @company, notice: 'Company was successfully created.'
        else
          flash.now[:alert] =  @company.errors.full_messages.join("<br>")
          render action: 'new'
        end
      else
        msg = ""
        msg << @company.errors.full_messages.join("<br>") if @company.errors.any?
        msg << @user.errors.full_messages.join("<br>") if @user.errors.any?
        flash.now[:alert] = msg
        render action: 'new'
      end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company.type_id = params[:company_type_id]
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def update_company_setting
    # render :text => params
    company_setting_id = CompanySetting.where("company_id = ?", setting_params[:company_id]).first
    if company_setting_id.present?
      company_setting_id.update(:allow_multiple_booking => setting_params[:allow_multiple_booking], :company_id => setting_params[:company_id] )      
    else
      CompanySetting.create!(:allow_multiple_booking => setting_params[:allow_multiple_booking], :company_id => setting_params[:company_id])
    end
    redirect_to company_path(setting_params[:company_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :registration_number, :address, :phone_number, :fax_number, :type_id, :parent_id,:slug)
    end

    def setting_params
      params.require(:company_setting).permit!
    end
end
