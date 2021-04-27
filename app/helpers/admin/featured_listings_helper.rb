module Admin::FeaturedListingsHelper
    def featured_listing_name(featured_listing_id)
        if featured_listing_id
            listing = FeaturedListing.find_by(id: featured_listing_id)
            listing.name
        else
            "none"
        end
    end
end
