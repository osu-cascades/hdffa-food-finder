require 'test_helper'

class AdminCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::CategoriesController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_categories_path
    assert_redirected_to new_user_session_path
    # show
    get admin_category_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_admin_category_path
    assert_redirected_to new_user_session_path
    # edit
    get edit_admin_category_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post admin_categories_path
    assert_redirected_to new_user_session_path
    # update
    patch admin_category_path(id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_category_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_category_path(id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'restricts guest user access' do
    assert defines_before_filter?(Admin::CategoriesController, :restrict_unless_admin)
  end

  test 'redirects requests from guest users to root url' do
    sign_in users(:guest)
    # index
    get admin_categories_path
    assert_redirected_to root_url
    # show
    get admin_category_path(id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_category_path
    assert_redirected_to root_url
    # edit
    get edit_admin_category_path(id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_categories_path
    assert_redirected_to root_url
    # update
    patch admin_category_path(id: 'fake')
    assert_redirected_to root_url
    put admin_category_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_category_path(id: 'fake')
    assert_redirected_to root_url
  end

end
