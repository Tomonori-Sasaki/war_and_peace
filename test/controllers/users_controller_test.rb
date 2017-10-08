require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should get mypage" do
    get users_mypage_url
    assert_response :success
  end

  test "should get practice" do
    get users_practice_url
    assert_response :success
  end

  test "should get boss" do
    get users_boss_url
    assert_response :success
  end

  test "should get communication" do
    get users_communication_url
    assert_response :success
  end

  test "should get settings" do
    get users_settings_url
    assert_response :success
  end

end
