require "application_system_test_case"

class WrappersTest < ApplicationSystemTestCase
  setup do
    @wrapper = wrappers(:one)
  end

  test "visiting the index" do
    visit wrappers_url
    assert_selector "h1", text: "Wrappers"
  end

  test "creating a Wrapper" do
    visit wrappers_url
    click_on "New Wrapper"

    click_on "Create Wrapper"

    assert_text "Wrapper was successfully created"
    click_on "Back"
  end

  test "updating a Wrapper" do
    visit wrappers_url
    click_on "Edit", match: :first

    click_on "Update Wrapper"

    assert_text "Wrapper was successfully updated"
    click_on "Back"
  end

  test "destroying a Wrapper" do
    visit wrappers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wrapper was successfully destroyed"
  end
end
