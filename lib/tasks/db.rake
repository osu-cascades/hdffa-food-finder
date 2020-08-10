require 'json'

namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    providers = json['Partners']
    providers.each do |key, val|
      Provider.create!(name: key, 
        latitude: val['Latitude'], 
        longitude: val['Longitude'], 
        description: val['Description'],
        street_address: val['Street Address'], 
        city: val['City'], 
        state: val['State'], 
        zip: val['ZIP'], 
        email: val['Email'], 
        phone: val['Phone'],
        url: val['Website'],
        hours_of_operation: val['Hours of Operation: Dates and times'],
        keywords: val['Search Terms']
      )
    end
  end

end
