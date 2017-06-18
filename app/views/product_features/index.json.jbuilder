json.array!(@product_features) do |product_feature|
  json.extract! product_feature, :id, :product_id, :name
  json.url product_feature_url(product_feature, format: :json)
end
