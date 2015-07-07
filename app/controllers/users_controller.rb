class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_project_owner!
  before_action :set_user, only: [:show, :edit, :update_member, :destroy, :suspend, :activate]

  # GET /users
  # GET /users.json
  def index
    @company = current_user.company
    @users = []
    @users << @company.users
    @company.agencies.each do |agency|
      @users << agency.users
    end
    @users.flatten!
    @users.sort_by! {|user| [user.company_id, user.name]}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    @company = current_user.company
    @user = @company.users.new
    @agencies = @company.agencies
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create_member
    @company = current_user.company
    @user = User.new(user_params)
    @user.company_id = current_user.company_id if @user.company_id.blank?
    @user.type_id = params[:user_type_id]

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created }
      else
        format.html { 
          @agencies = @company.agencies
          flash[:alert] = @user.errors.full_messages.join("<br>")
          render action: 'new' 
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update_member
    @company = current_user.company
    @user.type_id = params[:user_type_id]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          @agencies = @company.agencies
          flash[:alert] = @user.errors.full_messages.join("<br>")
          render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def suspend
    @user.suspend!
    flash[:notice] = "User has been suspended successfully."
    redirect_to :back
  end

  def activate
    @user.activate!
    flash[:notice] = "User has been activated successfully."
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:display_name, :type_id, :company_id, :email, :password, :password_confirmation, :username)
    end
end
