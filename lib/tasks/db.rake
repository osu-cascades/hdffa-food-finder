require 'json'

namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    providers = json['Partners']
    providers.each do |key, val|
      website = val['Website']
      phone = val['Phone']
      if(!website.start_with?("https"))
        website = "https://" + website
      end
      if (phone.size < 10)
        phone = ''
      end
      Provider.create!(name: key, 
        latitude: val['Latitude'], 
        longitude: val['Longitude'], 
        description: val['Description'],
        street_address: val['Street Address'], 
        city: val['City'], 
        state: val['State'], 
        zip: val['ZIP'], 
        email: val['Email'], 
        phone: phone,
        url: website.downcase!,
        hours_of_operation: val['Hours of Operation: Dates and times'],
        keywords: val['Search Terms']
      )
    end
  end
end
