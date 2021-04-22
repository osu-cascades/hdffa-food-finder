require 'json'

namespace :db do
  desc "Import Partner values into database"
  task import_partners: :environment do
    json = JSON.parse(File.read('lib/assets/hdffa-app-export.json.txt'))
    partners = json['Partners']
    partners.each do |key, val|
      partner = Partner.create!(
        name: key,
        latitude: val['Latitude'],
        longitude: val['Longitude'],
        description: val['Description'],
        street_address: val['Street Address'],
        city: val['City'],
        state: val['State'],
        zip: val['ZIP'],
        email: val['Email'],
        phone: val['Phone'].size < 10 ? '' : val['Phone'],
        url: (val['Website'].start_with?('https') ? val['Website'] : "https://#{val['Website']}").downcase!,
        hours_of_operation: val['Hours of Operation: Dates and times'],
        discount: val['Discount'],
      )
      category_name = val['Category']
      unless category_name.blank?
        category = Category.find_or_create_by(name: category_name)
        category.partners << partner
      end
      product_names = val['Products'].to_s().split(',')
      product_names.each do |product_name|
        unless product_name.blank?
          product = Product.find_or_create_by(name: product_name)
          product.partners << partner
        end
      end
    end
  end
end
