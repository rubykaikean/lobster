class Api::V1::UnitController < Api::V1::BaseController
  def create
    lots = Lot.find(params[:id])

    render(json: Api::V1::ReservationSerializer.new(lots).to_json)
  end
end