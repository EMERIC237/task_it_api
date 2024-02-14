require "test_helper"

class DailyPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get daily_plans_show_url
    assert_response :success
  end

  test "should get create" do
    get daily_plans_create_url
    assert_response :success
  end

  test "should get update" do
    get daily_plans_update_url
    assert_response :success
  end

  test "should get destroy" do
    get daily_plans_destroy_url
    assert_response :success
  end
end
