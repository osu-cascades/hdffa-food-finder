class CreateFeaturedListings < ActiveRecord::Migration[5.2]
  def change
    create_table :featured_listings do |t|
      t.string :name

      t.timestamps
    end
  end
end
