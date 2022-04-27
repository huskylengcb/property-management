require "test_helper"

class TowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tower = towers(:one)
  end

  test "should get index" do
    get towers_url
    assert_response :success
  end

  test "should get new" do
    get new_tower_url
    assert_response :success
  end

  test "should create tower" do
    assert_difference("Tower.count") do
      post towers_url, params: { tower: {  } }
    end

    assert_redirected_to tower_url(Tower.last)
  end

  test "should show tower" do
    get tower_url(@tower)
    assert_response :success
  end

  test "should get edit" do
    get edit_tower_url(@tower)
    assert_response :success
  end

  test "should update tower" do
    patch tower_url(@tower), params: { tower: {  } }
    assert_redirected_to tower_url(@tower)
  end

  test "should destroy tower" do
    assert_difference("Tower.count", -1) do
      delete tower_url(@tower)
    end

    assert_redirected_to towers_url
  end
end
