require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    data_hash = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    puts JSON.pretty_generate(data_hash).gsub(":", " =>")
    puts data_hash["Partners"]["900 Wall Restaurant"]
    puts data_hash["Partners"]["Agricultural Connections"]
  

  end

end
