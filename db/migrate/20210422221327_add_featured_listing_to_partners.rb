class AddFeaturedListingToPartners < ActiveRecord::Migration[5.2]
  def change
    add_reference :partners, :featured_listing
  end
end