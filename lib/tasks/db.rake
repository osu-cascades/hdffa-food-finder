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
  end

end
