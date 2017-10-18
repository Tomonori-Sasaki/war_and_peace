class BattlesController < ApplicationController
  def show
    @my_monster = MonsterDetail.find(params[:my_id].to_i)
    @opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)
    @my_monster_skills = @my_monster.skill_detail
  end

  def skill_update
    selected_skill = SkillDetail.find(params[:id].to_i)
    selected_skill.pp_left -= 1
    selected_skill.save

    my_monster = MonsterDetail.find(params[:my_id].to_i)
    opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)

    if my_monster.type == selected_skill.skill_datum.type
      type_matched_factor = 1.5
    else
      type_matched_factor = 1
    end

    if selected_skill.skill_datum.type == opponent_monster.type
      compatibility = 0.5
    elsif selected_skill.skill_datum.type == "草" && opponent_monster.type == "水"
      compatibility = 2
    elsif selected_skill.skill_datum.type == "水" && opponent_monster.type == "火"
      compatibility = 2
    elsif selected_skill.skill_datum.type == "火" && opponent_monster.type == "草"
      compatibility = 2
    else
      compatibility = 1
    end

    how_many_damage = ((my_monster.level * 2 / 5.0 + 2) * selected_skill.skill_datum.power * my_monster.attack / opponent_monster.defence.to_f / 50.0 + 2) * rand(85..100) / 100.0 * type_matched_factor * compatibility

    if opponent_monster.hp_left > how_many_damage.to_i
      opponent_monster.hp_left -= how_many_damage.to_i
    else
      opponent_monster.hp_left = 0
    end

    opponent_monster.save

    if opponent_monster.hp_left == 0
      redirect_to(battles_finished_path)
    else
      redirect_to(battles_show_path(params[:my_id].to_i, params[:opponent_id].to_i))
    end
  end
end
