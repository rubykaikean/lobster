class Api::V1::ReservationsController < Api::V1::BaseController
before_action :set_lot, only: [:show, :update, :destroy]

  def show
    lots = Product.find(params[:id]).lots.order(id: "ASC")

    render(
      json: ActiveModel::ArraySerializer.new(
        lots,
        each_serializer: Api::V1::ReservationSerializer
      )
    )
  end
  
  def update
    #render :text => params.to_json
    #reservation_data = JSON.parse(params["reservation"].to_json)
    #render json: reservation_data["reserve"]["buyer_info"].to_json
    params.permit!

    @lot = Lot.find(params[:id])
    @setting = @lot.product.product_setting

    data = { 
      lot: @lot,
      setting: @setting,
      buyer_data: params[:buyer],
      payment_type_id: params["sale"]["payment_type_id"],
      booking_fee: params["sale"]["payment_type_id"],
      user_id: 1
    }
    
    result = SaleEngine.reserve(data)
    case result[:status]
    when 201
      render :text => result[:message]
    when 403
      render :text => result[:message]
    when 400
      render :text => result[:message]
    end
  end

  private

  def set_lot
    @lot = Lot.find(params[:id])
  end

  def lot_params
    params.permit(:status_id)
  end
end