require 'application_system_test_case'

class ProductsTest < ApplicationSystemTestCase

  test 'viewing a list of Products' do
    visit products_url
    assert_text products(:one).name
  end

  test 'viewing a Product' do
    product = products(:one)
    visit product_url(product)
    assert_text product.name
  end

  # API

  test 'retrieving a list of Product data' do
    visit products_url(format: :json)
    product_names = JSON.parse(page.body).collect { |p| p['name'] }
    assert_includes(product_names, products(:one).name)
  end

  test 'retrieving a Product\'s data' do
    product = products(:one)
    visit product_url(product, format: :json)
    product_json = JSON.parse(page.body)
    assert_equal(product.name, product_json['name'])
  end

end
