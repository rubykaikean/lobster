if Rails.env.development?
  namespace = "lobster_development"
elsif Rails.env.staging?
  namespace = "lobster_staging"
elsif Rails.env.production?
  namespace = "lobster_production"
end

Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://127.0.0.1/12', :namespace => "#{namespace}" }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://127.0.0.1:6379/12', :namespace => "#{namespace}", :size => 1  }
end