require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  setup do
    @provider = providers(:one)
  end

  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit providers_url
    click_on "New Provider"
    fill_in "Name", with: @provider.name
    click_on "Create Provider"
    assert_text "Provider was successfully created"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first
    fill_in "Name", with: @provider.name
    click_on "Update Provider"
    assert_text "Provider was successfully updated"
  end

  test "destroying a Provider" do
    visit providers_url
    click_on "Destroy", match: :first
    assert_text "Provider was successfully destroyed"
  end
end
