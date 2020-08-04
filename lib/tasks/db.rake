require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    providers = json['Partners']
    providers.each do |key, val|
      Provider.create!(name: key, latitude: val['Latitude'], longitude: val['Longitude'])
    end
  end

end
