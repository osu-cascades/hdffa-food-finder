require 'application_system_test_case'

class AdminSearchTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test 'performing a blank search' do
    visit search_path
    assert_text 'Search Results'
  end

end
