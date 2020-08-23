require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test 'Category has a name' do
    assert_respond_to(Category.new, :name)
  end

  test 'Category without a name is invalid' do
    category = categories(:one)
    assert category.valid?
    category.name = nil
    refute category.valid?
  end

  test 'Category with a non-unique name is invalid' do
    existing_category_name = categories(:one).name
    category = categories(:two)
    assert category.valid?
    category.name = existing_category_name
    refute category.valid?
  end

  test '#to_s string representation is the category name' do
    assert_equal(categories(:one).name, categories(:one).to_s)
  end

end
