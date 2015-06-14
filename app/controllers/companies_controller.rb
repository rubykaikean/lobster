class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy, :update_setting]

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.company.agencies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

    @setting = @company.company_setting
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  def new
    @company = current_user.company.agencies.new
    @user = User.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.company.agencies.new(company_params)
    @company.type_id = Company::AGENCY

    @user = User.new(email: params[:company_email], password: params[:company_password], password_confirmation: params[:company_password_confirmation], display_name: "Admin")
    @user.type_id = User::ADMIN
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

  def update_profile
    @company = current_user.company
    respond_to do |format|
      if @company.update(company_params)
        format.html {  flash[:notice] = 'Company profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { flash[:alert] = @company.errors.full_messages.join("<br>") }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
    redirect_to root_path
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

  def update_setting
    # render :text => params
    @setting = @company.company_setting
    flash[:notice] = "Setting was updated successfully."
    @setting.update(:allow_multiple_booking => setting_params[:allow_multiple_booking] )
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = current_user.company.agencies.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :registration_number, :address, :phone_number, :fax_number, :type_id, :parent_id,:slug)
    end

    def setting_params
      params.require(:company_setting).permit!
    end
end
