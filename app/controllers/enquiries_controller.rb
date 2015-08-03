class EnquiriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, only: [:index, :show]
  before_action :find_product
  before_action :set_enquiry, only: [:show]

  # GET /enquiries
  # GET /enquiries.json
  def index
    @enquiries = @product.enquiries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enquiries }
    end
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
    @product.enquiries.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enquiry }
    end
  end

  # GET /enquiries/new
  # def new
  #   @enquiry = Enquiry.new
  # end

  # GET /enquiries/1/edit
  # def edit
  # end

  # POST /enquiries
  # POST /enquiries.json
  def create
    Rails.logger.info params
    # @enquiry = Enquiry.new(enquiry_params)

    # respond_to do |format|
    #   if @enquiry.save
    #     format.html { redirect_to @enquiry, notice: 'Enquiry was successfully created.' }
    #     format.json { render json: @enquiry, status: :created }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @enquiry.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /enquiries/1
  # PATCH/PUT /enquiries/1.json
  # def update
  #   respond_to do |format|
  #     if @enquiry.update(enquiry_params)
  #       format.html { redirect_to @enquiry, notice: 'Enquiry was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @enquiry.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  # def destroy
  #   @enquiry.destroy
  #   respond_to do |format|
  #     format.html { redirect_to enquiries_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = @product.enquiries.find(params[:id])
    end

    def find_product
      @product = Product.friendly.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_params
      params.require(:enquiry).permit(:product_id)
    end
end
