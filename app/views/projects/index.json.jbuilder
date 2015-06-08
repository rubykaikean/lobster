json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :status_id, :company_id
  json.url project_url(project, format: :json)
end
