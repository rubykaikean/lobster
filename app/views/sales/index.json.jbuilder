json.array!(@sales) do |sale|
  json.extract! sale, :id, :project_id, :product_id, :lot_unit_id, :phase_id, :user_id, :status_id
  json.url sale_url(sale, format: :json)
end
