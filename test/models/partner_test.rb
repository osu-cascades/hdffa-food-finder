require 'test_helper'

class PartnerTest < ActiveSupport::TestCase

  def new_partner
    Partner.new(name: 'Fake',
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

  test 'Partner has a name' do
    assert_respond_to(Partner.new, :name)
  end

  test 'Partner has a latitude' do
    assert_respond_to(Partner.new, :latitude)
  end

  test 'Partner has a longitude' do
    assert_respond_to(Partner.new, :longitude)
  end

  test 'Partner has a description' do
    assert_respond_to(Partner.new, :description)
  end

  test 'Partner has a street_address' do
    assert_respond_to(Partner.new, :street_address)
  end

  test 'Partner has a city' do
    assert_respond_to(Partner.new, :city)
  end

  test 'Partner has a state' do
    assert_respond_to(Partner.new, :state)
  end

  test 'Partner has a zip' do
    assert_respond_to(Partner.new, :zip)
  end

  test 'Partner has a email' do
    assert_respond_to(Partner.new, :email)
  end

  test 'Partner has a phone number' do
    assert_respond_to(Partner.new, :phone)
  end

  test 'Partner has a URL' do
    assert_respond_to(Partner.new, :url)
  end

  test 'Partner has hours of operation' do
    assert_respond_to(Partner.new, :hours_of_operation)
  end

  test 'Partner has keywords' do
    assert_respond_to(Partner.new, :keywords)
  end

  test 'Partner without a name is invalid' do
    partner = new_partner
    assert partner.valid?
    partner.name = nil
    refute partner.valid?
  end

  test 'Partner with a non-unique name is invalid' do
    existing_partner_name = partners(:one).name
    partner = partners(:two)
    assert partner.valid?
    partner.name = existing_partner_name
    refute partner.valid?
  end

  test 'Partner with an invalid email is invalid' do
    partner = new_partner
    assert partner.valid?
    partner.email = 'Invalid'
    refute partner.valid?
  end

  test 'Partner has a valid phone number' do
    partner = new_partner
    assert partner.valid?
    partner.phone = 'Invalid'
    refute partner.valid?
  end

  test 'Partner has a valid URL' do
    partner = new_partner
    assert partner.valid?
    partner.url = 'Invalid'
    refute partner.valid?
  end

  test '#to_s string representation is the partner name' do
    assert_equal(partners(:one).name, partners(:one).to_s)
  end

end
