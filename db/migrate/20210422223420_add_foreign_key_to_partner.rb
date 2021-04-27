class AddForeignKeyToPartner < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :partners, :featured_listings
  end
end
