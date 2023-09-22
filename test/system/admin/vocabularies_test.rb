require "application_system_test_case"

class Admin::VocabulariesTest < ApplicationSystemTestCase
  setup do
    @admin_vocabulary = admin_vocabularies(:one)
  end

  test "visiting the index" do
    visit admin_vocabularies_url
    assert_selector "h1", text: "Vocabularies"
  end

  test "should create vocabulary" do
    visit admin_vocabularies_url
    click_on "New vocabulary"

    click_on "Create Vocabulary"

    assert_text "Vocabulary was successfully created"
    click_on "Back"
  end

  test "should update Vocabulary" do
    visit admin_vocabulary_url(@admin_vocabulary)
    click_on "Edit this vocabulary", match: :first

    click_on "Update Vocabulary"

    assert_text "Vocabulary was successfully updated"
    click_on "Back"
  end

  test "should destroy Vocabulary" do
    visit admin_vocabulary_url(@admin_vocabulary)
    click_on "Destroy this vocabulary", match: :first

    assert_text "Vocabulary was successfully destroyed"
  end
end
