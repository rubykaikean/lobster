json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :e_brochure_url
end
