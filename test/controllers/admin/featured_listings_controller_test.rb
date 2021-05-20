require 'test_helper'

class Admin::FeaturedListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_featured_listings_create_url
    assert_response :redirect
  end

end
