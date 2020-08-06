require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase

  test 'viewing a list of Providers' do
    visit providers_url
    assert_text providers(:one).name
  end

  test 'viewing a Provider' do
    provider = providers(:one)
    visit provider_url(provider)
    assert_text provider.name
  end

  # API

  test 'retrieving a list of Provider data' do
    visit providers_url(format: :json)
    provider_names = JSON.parse(page.body).collect { |p| p['name'] }
    assert_includes(provider_names, providers(:one).name)
  end

  test 'retrieving a Provider\'s data' do
    provider = providers(:one)
    visit provider_url(provider, format: :json)
    provider_json = JSON.parse(page.body)
    assert_equal(provider.name, provider_json['name'])
  end

end
