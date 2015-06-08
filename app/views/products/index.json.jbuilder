json.array!(@products) do |product|
  json.extract! product, :id, :name, :type_id, :description, :status_id, :phase_id
  json.url product_url(product, format: :json)
end
