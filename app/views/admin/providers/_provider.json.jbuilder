json.extract! provider, :id, :name, :latitude, :longitude, :created_at, :updated_at
json.url admin_provider_url(provider, format: :json)
