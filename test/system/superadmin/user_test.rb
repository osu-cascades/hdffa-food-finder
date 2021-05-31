require 'application_system_test_case'

class SuperAdminUserTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:superadmin)
  end

  test 'view user delete button' do
    visit users_path
    assert_text 'Delete'
  end

end