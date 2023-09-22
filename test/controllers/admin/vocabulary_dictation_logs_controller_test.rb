require "test_helper"

class Admin::VocabularyDictationLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_vocabulary_dictation_log = admin_vocabulary_dictation_logs(:one)
  end

  test "should get index" do
    get admin_vocabulary_dictation_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_vocabulary_dictation_log_url
    assert_response :success
  end

  test "should create admin_vocabulary_dictation_log" do
    assert_difference("Admin::VocabularyDictationLog.count") do
      post admin_vocabulary_dictation_logs_url, params: { admin_vocabulary_dictation_log: {  } }
    end

    assert_redirected_to admin_vocabulary_dictation_log_url(Admin::VocabularyDictationLog.last)
  end

  test "should show admin_vocabulary_dictation_log" do
    get admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
    assert_response :success
  end

  test "should update admin_vocabulary_dictation_log" do
    patch admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log), params: { admin_vocabulary_dictation_log: {  } }
    assert_redirected_to admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
  end

  test "should destroy admin_vocabulary_dictation_log" do
    assert_difference("Admin::VocabularyDictationLog.count", -1) do
      delete admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log)
    end

    assert_redirected_to admin_vocabulary_dictation_logs_url
  end
end
