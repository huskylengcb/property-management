require "application_system_test_case"

class TowersTest < ApplicationSystemTestCase
  setup do
    @tower = towers(:one)
  end

  test "visiting the index" do
    visit towers_url
    assert_selector "h1", text: "Towers"
  end

  test "should create tower" do
    visit towers_url
    click_on "New tower"

    click_on "Create Tower"

    assert_text "Tower was successfully created"
    click_on "Back"
  end

  test "should update Tower" do
    visit tower_url(@tower)
    click_on "Edit this tower", match: :first

    click_on "Update Tower"

    assert_text "Tower was successfully updated"
    click_on "Back"
  end

  test "should destroy Tower" do
    visit tower_url(@tower)
    click_on "Destroy this tower", match: :first

    assert_text "Tower was successfully destroyed"
  end
end
