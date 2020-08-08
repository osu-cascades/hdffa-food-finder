require 'application_system_test_case'

class AdminProvidersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test 'viewing a list of Providers' do
    visit admin_providers_url
    assert_text 'Providers'
    assert_text providers(:one).name
  end

  test 'viewing a Provider' do
    provider = providers(:one)
    visit admin_provider_url(provider)
    assert_text provider.name
  end

  test 'creating a Provider' do
    visit new_admin_provider_url
    fill_in 'Name', with: 'FAKE'
    fill_in 'Email', with: 'fake@example.com'
    click_on 'Create Provider'
    assert_text 'Provider was successfully created'
  end

  test 'updating a Provider' do
    visit edit_admin_provider_url(providers(:one))
    fill_in 'Name', with: 'NEW FAKE NAME'
    click_on 'Update Provider'
    assert_text 'Provider was successfully updated'
    assert_text 'NEW FAKE NAME'
  end

  test 'destroying a Provider' do
    visit admin_providers_url
    click_on 'Delete', match: :first
    assert_text 'Provider was successfully destroyed'
  end

end
