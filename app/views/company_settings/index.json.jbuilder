json.array!(@company_settings) do |company_setting|
  json.extract! company_setting, :id, :company_id, :allow_multiple_booking
  json.url company_setting_url(company_setting, format: :json)
end
