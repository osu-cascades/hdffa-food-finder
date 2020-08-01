require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    # { 'Providers': {
    #   'Foo Farms': {
    #     'City': 'Madras',
    #     'Latitude': 42.3,
    #     'Longitude': 77.9
    #   },
    #   'Bar Ranch': {
    #     'City': 'Bend',
    #     'Latitude': 17.3,
    #     'Longitude': 12.3
    #   },
    #   ...
    # }
    # Think about the structure of the data above.
    # Look at the Ruby Hash API documentation.
    #
    # Goal:
    # What is a good 'starting point?'
    # For every ____, do...
    #   Provider.create!(name: ___, latitude: ___, longitude: ___)
    # end
    json.each do |key,v|
      v.each do |key1, value|
        puts "#{key1} has a lat of #{value["Latitude"]} and a long of #{value["Longitude"]}"
        Provider.create!(name: key1, latitude: value["Latitude"], longitude: value["Longitude"])
      end
    end
  end

end
