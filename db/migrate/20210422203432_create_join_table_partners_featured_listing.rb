class CreateJoinTablePartnersFeaturedListing < ActiveRecord::Migration[5.2]
  def change
    create_join_table :partners, :featured_listings do |t|
      # t.index [:partner_id, :featured_listing_id]
      # t.index [:featured_listing_id, :partner_id]
    end
  end
end
