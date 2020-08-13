require 'test_helper'

class AdminCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::ProvidersController, :authenticate_user!))
  end

  test 'TODO' do
    skip
  end

end
