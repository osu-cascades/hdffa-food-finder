json.extract! partner, :id, :name, :description, :street_address, :city, :state, :zip, :email, :latitude, :longitude, :created_at, :updated_at, :categories, :products
json.url partner_url(partner, format: :json)
