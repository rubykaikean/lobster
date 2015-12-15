class Api::V1::ReservationSerializer < ActiveModel::Serializer

  attributes :id, :name, :slug, :created_at, :updated_at, :product_type_id, :product_type, :status_id, :status, :selling_price, :row_key, :is_special_unit


  def status
    case status_id
    when Lot::AVAILABLE
      "AVAILABLE"
    when Lot::RESERVED
      "RESERVED"
    when Lot::SOLD
      "SOLD"
    when Lot::BLOCKED
      "BLOCKED"
    end
  end

  def product_type
    ProductType.find(product_type_id).name
  end

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end

end
