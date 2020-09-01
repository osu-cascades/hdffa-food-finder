json.extract! partner, :id, :name, :description, :street_address, :city, :state, :zip, :email, :latitude, :longitude, :created_at, :updated_at
json.url admin_provider_url(partner, format: :json)
