require 'json'

namespace :db do
  desc "Import Partner values into database"
  task import_ppartners: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    ppartners = json['Partners']
    ppartners.each do |key, val|
      website = val['Website']
      phone = val['Phone']
      if(!website.start_with?("https"))
        website = "https://" + website
      end
      if (phone.size < 10)
        phone = ''
      end
      Ppartner.create!(name: key, 
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
