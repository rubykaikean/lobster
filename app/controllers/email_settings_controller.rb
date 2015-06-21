class EmailSettingsController < ApplicationController
  before_action :set_email_setting, only: [:show, :edit, :update, :destroy]

  # GET /email_settings
  # GET /email_settings.json
  def index
    @email_settings = EmailSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_settings }
    end
  end

  # GET /email_settings/1
  # GET /email_settings/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_setting }
    end
  end

  # GET /email_settings/new
  def new
    @email_setting = EmailSetting.new
  end

  # GET /email_settings/1/edit
  def edit
  end

  # POST /email_settings
  # POST /email_settings.json
  def create
    @email_setting = EmailSetting.new(email_setting_params)

    respond_to do |format|
      if @email_setting.save
        format.html { redirect_to @email_setting, notice: 'Email setting was successfully created.' }
        format.json { render json: @email_setting, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @email_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_settings/1
  # PATCH/PUT /email_settings/1.json
  def update
    respond_to do |format|
      if @email_setting.update(email_setting_params)
        format.html { redirect_to @email_setting, notice: 'Email setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_settings/1
  # DELETE /email_settings/1.json
  def destroy
    @email_setting.destroy
    respond_to do |format|
      format.html { redirect_to email_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_setting
      @email_setting = EmailSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_setting_params
      params.require(:email_setting).permit(:product_id, :subject, :from, :body)
    end
end
