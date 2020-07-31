require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    data_hash = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    data_hash.each do |key, value|
      puts "#{key}"
    end

  end

end
