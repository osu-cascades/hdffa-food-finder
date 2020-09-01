require 'application_system_test_case'

class AdminPartnersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test 'viewing a list of Partners' do
    visit admin_partners_url
    assert_text 'Partners'
    assert_text partners(:one).name
  end

  test 'viewing a Partner' do
    partner = partners(:one)
    visit admin_partner_url(partner)
    assert_text partner.name
  end

  test 'creating a Partner' do
    visit new_admin_partner_url
    fill_in 'Name', with: 'FAKE'
    fill_in 'Email', with: 'fake@example.com'
    click_on 'Create Partner'
    assert_text 'Partner was successfully created'
  end

  test 'updating a Partner' do
    visit edit_admin_partner_url(partners(:one))
    fill_in 'Name', with: 'NEW FAKE NAME'
    click_on 'Update Partner'
    assert_text 'Partner was successfully updated'
    assert_text 'NEW FAKE NAME'
  end

  test 'destroying a Partner' do
    visit admin_partners_url
    click_on 'Delete', match: :first
    assert_text 'Partner was successfully destroyed'
  end

end
