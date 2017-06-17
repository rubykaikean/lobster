json.array!(@product_photos) do |product_photo|
  json.extract! product_photo, :id, :product
  json.url product_photo_url(product_photo, format: :json)
end
