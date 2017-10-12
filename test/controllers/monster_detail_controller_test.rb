require 'test_helper'

class MonsterDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get monster_detail_index_url
    assert_response :success
  end

  test "should get new" do
    get monster_detail_new_url
    assert_response :success
  end

  test "should get edit" do
    get monster_detail_edit_url
    assert_response :success
  end

  test "should get show" do
    get monster_detail_show_url
    assert_response :success
  end

end
