json.extract! partner, :id, :name, :description, :street_address, :city, :state, :zip, :email, :latitude, :longitude, :created_at, :updated_at
<<<<<<< HEAD
json.url admin_provider_url(partner, format: :json)
=======
json.url admin_partner_url(partner, format: :json)
>>>>>>> 945ad70db08c88ea8155dc59577e347bbd726228
