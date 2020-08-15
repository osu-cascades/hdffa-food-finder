require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase

  test 'viewing a list of Categories' do
    visit categories_url
    assert_text categories(:one).name
  end

  test 'viewing a Category' do
    category = categories(:one)
    visit category_url(category)
    assert_text category.name
  end

  # API

  test 'retrieving a list of Category data' do
    visit categories_url(format: :json)
    category_names = JSON.parse(page.body).collect { |p| p['name'] }
    assert_includes(category_names, categories(:one).name)
  end

  test 'retrieving a Category\'s data' do
    category = categories(:one)
    visit category_url(category, format: :json)
    category_json = JSON.parse(page.body)
    assert_equal(category.name, category_json['name'])
  end

end
