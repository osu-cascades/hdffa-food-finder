require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'Product has a name' do
    assert_respond_to(Product.new, :name)
  end

  test 'Product without a name is invalid' do
    product = products(:one)
    assert product.valid?
    product.name = nil
    refute product.valid?
  end

  test 'Product with a non-unique name is invalid' do
    existing_product_name = products(:one).name
    product = products(:two)
    assert product.valid?
    product.name = existing_product_name
    refute product.valid?
  end

  test '#to_s string representation is the product name' do
    assert_equal(products(:one).name, products(:one).to_s)
  end

end