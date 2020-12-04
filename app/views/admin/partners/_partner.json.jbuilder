json.extract! partner, :id, :name, :description, :street_address, :city, :state, :zip, :email, :phone, :latitude, :longitude, :created_at, :updated_at
json.url admin_partner_url(partner, format: :json)
