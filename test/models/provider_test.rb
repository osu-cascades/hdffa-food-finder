require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

  test 'Provider has a name' do
    assert_respond_to(Provider.new, :name)
  end

  test 'Provider has a latitude' do
    assert_respond_to(Provider.new, :latitude)
  end

  test 'Provider has a longitude' do
    assert_respond_to(Provider.new, :longitude)
  end

  test 'Provider without a name is invalid' do
    provider = Provider.new(name: 'Fake', latitude: 42, longitude: 42)
    assert(provider.valid?)
    provider.name = nil
    refute(provider.valid?)
  end

end
