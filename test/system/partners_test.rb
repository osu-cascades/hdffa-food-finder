require 'application_system_test_case'

class PartnersTest < ApplicationSystemTestCase

  test 'viewing a list of Partners' do
    visit partners_url
    assert_text partners(:one).name
  end

  test 'viewing a Partner' do
    partner = partners(:one)
    visit partner_url(partner)
    assert_text partner.name
  end

  # API

  test 'retrieving a list of Partner data' do
    visit partners_url(format: :json)
    partner_names = JSON.parse(page.body).collect { |p| p['name'] }
    assert_includes(partner_names, partners(:one).name)
  end

  test 'retrieving a Partner\'s data' do
    partner = partners(:one)
    visit partner_url(partner, format: :json)
    partner_json = JSON.parse(page.body)
    assert_equal(partner.name, partner_json['name'])
  end

end
