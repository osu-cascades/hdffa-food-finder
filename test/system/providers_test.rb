require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit new_provider_url
    fill_in "Name", with: 'FAKE'
    fill_in "Latitude", with: 42
    fill_in "Longitude", with: 42
    click_on "Create Provider"
    assert_text "Provider was successfully created"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first
    fill_in "Name", with: 'FAKE'
    fill_in "Latitude", with: 42
    fill_in "Longitude", with: 42
    click_on "Update Provider"
    assert_text "Provider was successfully updated"
  end

  test "destroying a Provider" do
    visit providers_url
    click_on "Delete", match: :first
    assert_text "Provider was successfully destroyed"
  end
end
