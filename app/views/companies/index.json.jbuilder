json.array!(@companies) do |company|
  json.extract! company, :id, :name, :registration_number, :address, :phone_number, :fax_number
  json.url company_url(company, format: :json)
end
