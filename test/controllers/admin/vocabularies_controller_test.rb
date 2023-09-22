require "test_helper"

class Admin::VocabulariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_vocabulary = admin_vocabularies(:one)
  end

  test "should get index" do
    get admin_vocabularies_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_vocabulary_url
    assert_response :success
  end

  test "should create admin_vocabulary" do
    assert_difference("Admin::Vocabulary.count") do
      post admin_vocabularies_url, params: { admin_vocabulary: {  } }
    end

    assert_redirected_to admin_vocabulary_url(Admin::Vocabulary.last)
  end

  test "should show admin_vocabulary" do
    get admin_vocabulary_url(@admin_vocabulary)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_vocabulary_url(@admin_vocabulary)
    assert_response :success
  end

  test "should update admin_vocabulary" do
    patch admin_vocabulary_url(@admin_vocabulary), params: { admin_vocabulary: {  } }
    assert_redirected_to admin_vocabulary_url(@admin_vocabulary)
  end

  test "should destroy admin_vocabulary" do
    assert_difference("Admin::Vocabulary.count", -1) do
      delete admin_vocabulary_url(@admin_vocabulary)
    end

    assert_redirected_to admin_vocabularies_url
  end
end
