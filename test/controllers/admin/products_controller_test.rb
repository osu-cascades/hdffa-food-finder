require 'test_helper'

class AdminPartnersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::PartnersController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_partners_path
    assert_redirected_to new_user_session_path
    # show
    get admin_partner_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_admin_partner_path
    assert_redirected_to new_user_session_path
    # edit
    get edit_admin_partner_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post admin_partners_path
    assert_redirected_to new_user_session_path
    # update
    patch admin_partner_path(id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_partner_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_partner_path(id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'restricts guest user access' do
    assert defines_before_filter?(Admin::PartnersController, :restrict_unless_admin)
  end

  test 'redirects requests from guest users to root url' do
    sign_in users(:guest)
    # index
    get admin_partners_path
    assert_redirected_to root_url
    # show
    get admin_partner_path(id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_partner_path
    assert_redirected_to root_url
    # edit
    get edit_admin_partner_path(id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_partners_path
    assert_redirected_to root_url
    # update
    patch admin_partner_path(id: 'fake')
    assert_redirected_to root_url
    put admin_partner_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_partner_path(id: 'fake')
    assert_redirected_to root_url
  end

end
