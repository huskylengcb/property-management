require "application_system_test_case"

class Admin::VocabularyDictationLogsTest < ApplicationSystemTestCase
  setup do
    @admin_vocabulary_dictation_log = admin_vocabulary_dictation_logs(:one)
  end

  test "visiting the index" do
    visit admin_vocabulary_dictation_logs_url
    assert_selector "h1", text: "Vocabulary dictation logs"
  end

  test "should create vocabulary dictation log" do
    visit admin_vocabulary_dictation_logs_url
    click_on "New vocabulary dictation log"

    click_on "Create Vocabulary dictation log"

    assert_text "Vocabulary dictation log was successfully created"
    click_on "Back"
  end

  test "should update Vocabulary dictation log" do
    visit admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
    click_on "Edit this vocabulary dictation log", match: :first

    click_on "Update Vocabulary dictation log"

    assert_text "Vocabulary dictation log was successfully updated"
    click_on "Back"
  end

  test "should destroy Vocabulary dictation log" do
    visit admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
    click_on "Destroy this vocabulary dictation log", match: :first

    assert_text "Vocabulary dictation log was successfully destroyed"
  end
end
