json.array!(@sources_types) do |sources_type|
  json.extract! sources_type, :id, :name
  json.url sources_type_url(sources_type, format: :json)
end
