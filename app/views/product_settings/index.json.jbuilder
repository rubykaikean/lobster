json.array!(@product_settings) do |product_setting|
  json.extract! product_setting, :id, :allow_multiple_booking
  json.url product_setting_url(product_setting, format: :json)
end
