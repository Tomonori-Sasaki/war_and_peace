require 'test_helper'

class SkillDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill_datum = skill_data(:one)
  end

  test "should get index" do
    get skill_data_url
    assert_response :success
  end

  test "should get new" do
    get new_skill_datum_url
    assert_response :success
  end

  test "should create skill_datum" do
    assert_difference('SkillDatum.count') do
      post skill_data_url, params: { skill_datum: { accuracy: @skill_datum.accuracy, examination: @skill_datum.examination, name: @skill_datum.name, power: @skill_datum.power, pp: @skill_datum.pp, type: @skill_datum.type } }
    end

    assert_redirected_to skill_datum_url(SkillDatum.last)
  end

  test "should show skill_datum" do
    get skill_datum_url(@skill_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_skill_datum_url(@skill_datum)
    assert_response :success
  end

  test "should update skill_datum" do
    patch skill_datum_url(@skill_datum), params: { skill_datum: { accuracy: @skill_datum.accuracy, examination: @skill_datum.examination, name: @skill_datum.name, power: @skill_datum.power, pp: @skill_datum.pp, type: @skill_datum.type } }
    assert_redirected_to skill_datum_url(@skill_datum)
  end

  test "should destroy skill_datum" do
    assert_difference('SkillDatum.count', -1) do
      delete skill_datum_url(@skill_datum)
    end

    assert_redirected_to skill_data_url
  end
end
