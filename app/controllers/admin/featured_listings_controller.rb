class Admin::FeaturedListingsController < ApplicationController
  def create
    @featured_listing = FeaturedListing.new(featured_listing_params)
  end

  private

    def featured_listing_params
      params.require(:featured_listing).permit(:name)
    end
end
