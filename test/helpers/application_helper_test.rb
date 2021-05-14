require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def signed_in?
    @signed_in
  end

  def new_user_session_path
    '/users/new'
  end

  def destroy_user_session_path
    '/users/new'
  end

  test 'returns Sign Out when signed in' do
    @signed_in = true
    assert_match 'Sign Out', sign_in_or_out_link
  end

  test 'returns Sign In when not signed in' do
    skip("Test not relevant, we are not displaying a navbar sign in link anymore")
    @signed_in = false
    assert_match 'sign in', sign_in_or_out_link
  end

  test 'displays sign out link when user is logged in' do
    skip("See https://stackoverflow.com/questions/53514537/how-to-test-a-rails-5-helper-that-relies-on-devise-signed-in-helper-with-minit")
    assert_match 'Sign Out', sign_in_or_out_link
  end

end
