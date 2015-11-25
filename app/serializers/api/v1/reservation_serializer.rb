class Api::V1::ReservationSerializer < ActiveModel::Serializer

  attributes :id, :name, :slug, :created_at, :updated_at, :product_type_id, :status_id, :selling_price, :row_key, :is_special_unit

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end

end
