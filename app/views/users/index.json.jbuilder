json.array!(@users) do |user|
  json.extract! user, :id, :display_name, :type_id, :company_id, :slug
  json.url user_url(user, format: :json)
end
