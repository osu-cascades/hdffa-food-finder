require 'JSON'
namespace :db do
  desc "Import Provider values into database"
  task import_providers: :environment do
    data_hash = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    puts JSON.pretty_generate(data_hash).gsub(":", " =>")
    names = data_hash["Partners"].each_key{ |key| puts "#{key}"}
  
  

  end

end
