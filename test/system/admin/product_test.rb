require 'application_system_test_case'

class AdminProductsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test 'viewing a list of Products' do
    visit admin_products_url
    assert_text 'Products'
    assert_text products(:one).name
  end

  test 'viewing a Product' do
    product = products(:one)
    visit admin_product_url(product)
    assert_text product.name
  end

  test 'creating a Product' do
    visit new_admin_product_url
    fill_in 'Name', with: 'FAKE'
    click_on 'Create Product'
    assert_text 'product was successfully created'
  end

  test 'updating a Product' do
    visit edit_admin_product_url(products(:one))
    fill_in 'Name', with: 'NEW FAKE NAME'
    click_on 'Update Product'
    assert_text 'product was successfully updated'
    assert_text 'NEW FAKE NAME'
  end

  test 'destroying a Product' do
    visit admin_products_url
    click_on 'Delete', match: :first
    assert_text 'product was successfully destroyed'
  end

end