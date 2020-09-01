require 'test_helper'

class AdminProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::ProductsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_products_path
    assert_redirected_to new_user_session_path
    # show
    get admin_product_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_admin_product_path
    assert_redirected_to new_user_session_path
    # edit
    get edit_admin_product_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post admin_products_path
    assert_redirected_to new_user_session_path
    # update
    patch admin_product_path(id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_product_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_product_path(id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'restricts guest user access' do
    assert defines_before_filter?(Admin::ProductsController, :restrict_unless_admin)
  end

  test 'redirects requests from guest users to root url' do
    sign_in users(:guest)
    # index
    get admin_products_path
    assert_redirected_to root_url
    # show
    get admin_product_path(id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_product_path
    assert_redirected_to root_url
    # edit
    get edit_admin_product_path(id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_products_path
    assert_redirected_to root_url
    # update
    patch admin_product_path(id: 'fake')
    assert_redirected_to root_url
    put admin_product_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_product_path(id: 'fake')
    assert_redirected_to root_url
  end

end
