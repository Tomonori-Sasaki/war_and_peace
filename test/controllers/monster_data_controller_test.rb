require 'test_helper'

class MonsterDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_datum = monster_data(:one)
  end

  test "should get index" do
    get monster_data_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_datum_url
    assert_response :success
  end

  test "should create monster_datum" do
    assert_difference('MonsterDatum.count') do
      post monster_data_url, params: { monster_datum: { attack: @monster_datum.attack, attack_add: @monster_datum.attack_add, defence: @monster_datum.defence, defence_add: @monster_datum.defence_add, exp: @monster_datum.exp, hp: @monster_datum.hp, hp_add: @monster_datum.hp_add, image_name: @monster_datum.image_name, level: @monster_datum.level, name: @monster_datum.name, region_id: @monster_datum.region_id, speed: @monster_datum.speed, speed_add: @monster_datum.speed_add, tech1: @monster_datum.tech1, tech2: @monster_datum.tech2, tech3: @monster_datum.tech3, tech4: @monster_datum.tech4, type: @monster_datum.type } }
    end

    assert_redirected_to monster_datum_url(MonsterDatum.last)
  end

  test "should show monster_datum" do
    get monster_datum_url(@monster_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_datum_url(@monster_datum)
    assert_response :success
  end

  test "should update monster_datum" do
    patch monster_datum_url(@monster_datum), params: { monster_datum: { attack: @monster_datum.attack, attack_add: @monster_datum.attack_add, defence: @monster_datum.defence, defence_add: @monster_datum.defence_add, exp: @monster_datum.exp, hp: @monster_datum.hp, hp_add: @monster_datum.hp_add, image_name: @monster_datum.image_name, level: @monster_datum.level, name: @monster_datum.name, region_id: @monster_datum.region_id, speed: @monster_datum.speed, speed_add: @monster_datum.speed_add, tech1: @monster_datum.tech1, tech2: @monster_datum.tech2, tech3: @monster_datum.tech3, tech4: @monster_datum.tech4, type: @monster_datum.type } }
    assert_redirected_to monster_datum_url(@monster_datum)
  end

  test "should destroy monster_datum" do
    assert_difference('MonsterDatum.count', -1) do
      delete monster_datum_url(@monster_datum)
    end

    assert_redirected_to monster_data_url
  end
end
