json.array!(@buyers) do |buyer|
  json.extract! buyer, :id, :full_name, :ic_number, :address, :mobile_contact_number, :home_contact_number, :office_contact_number, :email, :status_id
  json.url buyer_url(buyer, format: :json)
end
