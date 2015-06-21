json.array!(@email_settings) do |email_setting|
  json.extract! email_setting, :id, :product_id, :subject, :from, :body
  json.url email_setting_url(email_setting, format: :json)
end
