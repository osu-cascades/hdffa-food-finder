require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    data_hash = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    puts JSON.pretty_generate(data_hash).gsub(":", " =>")
    long1 = data_hash["Partners"]["900 Wall Restaurant"]["Longitude"]
    lat1 = data_hash["Partners"]["900 Wall Restaurant"]["Latitude"]
    long2 = data_hash["Partners"]["Agricultural Connections"]["Longitude"]
    lat2 = data_hash["Partners"]["Agricultural Connections"]["Latitude"]
    puts "Latitude: #{lat1}, Longitude: #{long1}"
    puts "Latitude: #{lat2}, Longitude: #{long2}"
  

  end

end
