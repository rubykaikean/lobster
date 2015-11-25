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
    if @lot.update(lot_params)
      render json: @lot
    else
      render json: @lot.errors, status: :unprocessable_entity
    end

    @buyer = Buyer.new(buyer_params)
    @sale = Sale.new(sale_params)
  end

  #   respond_to do |format|
  #     if @activity.update_attributes(params[:activity])
  #       format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @activity.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def test
    lots = Lot.find(1)

    render(json: Api::V1::ReservationSerializer.new(lots).to_json)
  end

  private

  def set_lot
    @lot = Lot.find(params[:id])
  end

  def lot_params
    params.permit(:status_id)
  end

  def buyer_params
    params.permit(:full_name, :ic_number)
  end

  def sale_params
    params.permit(:status_id)
  end
end