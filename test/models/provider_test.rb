require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

  def new_provider
    Provider.new(name: 'Fake',
      latitude: 42,
      longitude: 42,
      street_address: 'Fake Address',
      city: 'Fake City',
      state: 'OR',
      zip: '11111',
      email: 'fake@example.com',
      phone: '(541) 610-4403',
      url: 'https://example.com',
      hours_of_operation: 'Monday - Friday')

  end

  test 'Provider has a name' do
    assert_respond_to(Provider.new, :name)
  end

  test 'Provider has a latitude' do
    assert_respond_to(Provider.new, :latitude)
  end

  test 'Provider has a longitude' do
    assert_respond_to(Provider.new, :longitude)
  end

  test 'Provider has a description' do
    assert_respond_to(Provider.new, :description)
  end

  test 'Provider has a street_address' do
    assert_respond_to(Provider.new, :street_address)
  end

  test 'Provider has a city' do
    assert_respond_to(Provider.new, :city)
  end

  test 'Provider has a state' do
    assert_respond_to(Provider.new, :state)
  end

  test 'Provider has a zip' do
    assert_respond_to(Provider.new, :zip)
  end

  test 'Provider has a email' do
    assert_respond_to(Provider.new, :email)
  end

  test 'Provider has a phone number' do
    assert_respond_to(Provider.new, :phone)
  end

  test 'Provider has a URL' do
    assert_respond_to(Provider.new, :url)
  end

  test 'Provider has hours of operation' do
    assert_respond_to(Provider.new, :hours_of_operation)
  end

  test 'Provider has keywords' do
    assert_respond_to(Provider.new, :keywords)
  end

  test 'Provider without a name is invalid' do
    provider = new_provider
    assert provider.valid?
    provider.name = nil
    refute provider.valid?
  end

  test 'Provider with a non-unique name is invalid' do
    existing_provider_name = providers(:one).name
    provider = providers(:two)
    assert provider.valid?
    provider.name = existing_provider_name
    refute provider.valid?
  end

  test 'Provider with an invalid email is invalid' do
    provider = new_provider
    assert provider.valid?
    provider.email = 'Invalid'
    refute provider.valid?
  end

  test 'Provider has a valid phone number' do
    provider = new_provider
    assert provider.valid?
    provider.phone = 'Invalid'
    refute provider.valid?
  end

  test 'Provider has a valid URL' do
    provider = new_provider
    assert provider.valid?
    provider.url = 'Invalid'
    refute provider.valid?
  end

end
