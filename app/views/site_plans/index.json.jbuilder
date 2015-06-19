json.array!(@site_plans) do |site_plan|
  json.extract! site_plan, :id, :project_id
  json.url site_plan_url(site_plan, format: :json)
end
