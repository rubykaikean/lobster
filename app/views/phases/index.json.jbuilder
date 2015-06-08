json.array!(@phases) do |phase|
  json.extract! phase, :id, :name, :description, :status_id, :project_id
  json.url phase_url(phase, format: :json)
end
