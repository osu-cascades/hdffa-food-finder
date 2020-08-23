require 'application_system_test_case'

class AdminCategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test 'viewing a list of Categories' do
    visit admin_categories_url
    assert_text 'Categories'
    assert_text categories(:one).name
  end

  test 'viewing a Category' do
    category = categories(:one)
    visit admin_category_url(category)
    assert_text category.name
  end

  test 'creating a Category' do
    visit new_admin_category_url
    fill_in 'Name', with: 'FAKE'
    click_on 'Create Category'
    assert_text 'Category was successfully created'
  end

  test 'updating a Category' do
    visit edit_admin_category_url(categories(:one))
    fill_in 'Name', with: 'NEW FAKE NAME'
    click_on 'Update Category'
    assert_text 'Category was successfully updated'
    assert_text 'NEW FAKE NAME'
  end

  test 'destroying a Category' do
    visit admin_categories_url
    click_on 'Delete', match: :first
    assert_text 'Category was successfully destroyed'
  end

end
