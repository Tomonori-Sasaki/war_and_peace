class BattlesController < ApplicationController
  before_action :opponent_monster_skill_update, only: :skill_update

  def show
    @my_monster = MonsterDetail.find(params[:my_id].to_i)
    @opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)
    @my_monster_skills = @my_monster.skill_detail
    @my_having_monsters = MonsterDetail.where(user_id: @current_user.id, having_flag: 1).order("created_at DESC").reject {|monster| monster == @my_monster }
  end

  def skill_update
    my_monster = MonsterDetail.find(params[:my_id].to_i)
    opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)

    if @random > ((opponent_monster.speed/(opponent_monster.speed + my_monster.speed).to_f)*100).round
      selected_skill = set_and_reduce_skill(params[:id])

      type_matched_factor = set_type_matched_factor(my_monster.type, selected_skill.skill_datum.type)

      compatibility = set_compatibility(selected_skill.skill_datum.type, opponent_monster.type)

      accuracy_factor = set_accuracy_factor(selected_skill)

      how_many_damage = ((my_monster.level * 2 / 5.0 + 2) * selected_skill.skill_datum.power * my_monster.attack / opponent_monster.defence.to_f / 50.0 + 2) * rand(85..100) / 100.0 * type_matched_factor * compatibility * accuracy_factor

      opponent_monster.hp_left = set_hp_left(opponent_monster.hp_left, how_many_damage)

      opponent_monster.save

      if opponent_monster.hp_left == 0
        flash[:notice] = "#{my_monster.name}の#{selected_skill.skill_datum.name}！ #{my_monster.name}は#{opponent_monster.name}を倒した！"
        redirect_to(battles_finished_path)
      else
        if accuracy_factor == 0
          flash[:notice] = "#{my_monster.name}の#{selected_skill.skill_datum.name}！ #{my_monster.name}の攻撃は外れた！"
        else
          flash[:notice] = "#{my_monster.name}の#{selected_skill.skill_datum.name}！ #{opponent_monster.name}に#{how_many_damage.round}のダメージ！"
        end
        redirect_to(battles_show_path(params[:my_id].to_i, params[:opponent_id].to_i))
      end
    end

  end

  def lose
  end

  def finished
  end

  private
  def set_and_reduce_skill(skill_detail_id)
    selected_skill = SkillDetail.find(skill_detail_id.to_i)
    selected_skill.pp_left -= 1
    selected_skill.save
    return selected_skill
  end

  def set_type_matched_factor(monster_type, skill_type)
    if monster_type == skill_type
      type_matched_factor = 1.5
    else
      type_matched_factor = 1
    end
  end

  def set_compatibility(skill_type, monster_type)
    if skill_type == monster_type
      compatibility = 0.5
    elsif skill_type == "草" && monster_type == "火"
      compatibility = 0.5
    elsif skill_type == "水" && monster_type == "草"
      compatibility = 0.5
    elsif skill_type == "火" && monster_type == "水"
      compatibility = 0.5
    elsif skill_type == "草" && monster_type == "水"
      compatibility = 2
    elsif skill_type == "水" && monster_type == "火"
      compatibility = 2
    elsif skill_type == "火" && monster_type == "草"
      compatibility = 2
    end
  end

  def set_hp_left(hp_left, damage)
    if hp_left > damage.round
      hp_left -= damage.round
    else
      hp_left = 0
    end
  end

  def set_accuracy_factor(skill)
    if rand(0..100) <= skill.skill_datum.accuracy
      accuracy_factor = 1
    else
      accuracy_factor = 0
    end
  end

  def opponent_monster_skill_update
    my_monster = MonsterDetail.find(params[:my_id].to_i)
    opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)
    @random = rand(0..100)

    if @random <= ((opponent_monster.speed/(opponent_monster.speed + my_monster.speed).to_f)*100).round
      how_many_damage_array = []

      opponent_monster.skill_detail.each do |selected_skill|
        type_matched_factor = set_type_matched_factor(opponent_monster.type, selected_skill.skill_datum.type)

        compatibility = set_compatibility(selected_skill.skill_datum.type, my_monster.type)

        how_many_damage = ((opponent_monster.level * 2 / 5.0 + 2) * selected_skill.skill_datum.power * opponent_monster.attack / my_monster.defence.to_f / 50.0 + 2) * rand(85..100) / 100.0 * type_matched_factor * compatibility

        how_many_damage_array << how_many_damage
      end

      accuracy_factor = set_accuracy_factor(opponent_monster.skill_detail[how_many_damage_array.index(how_many_damage_array.max)])

      my_monster.hp_left = set_hp_left(my_monster.hp_left, how_many_damage_array.max * accuracy_factor)

      my_monster.save

      if my_monster.hp_left == 0
        flash[:notice] = "#{opponent_monster.name}の#{opponent_monster.skill_detail[how_many_damage_array.index(how_many_damage_array.max)].skill_datum.name}！ #{opponent_monster.name}は#{my_monster.name}を倒した！"
        redirect_to(battles_lose_path)
      else
        if accuracy_factor == 0
          flash[:notice] = "#{opponent_monster.name}の#{opponent_monster.skill_detail[how_many_damage_array.index(how_many_damage_array.max)].skill_datum.name}！ #{opponent_monster.name}の攻撃は外れた！"
        else
          flash[:notice] = "#{opponent_monster.name}の#{opponent_monster.skill_detail[how_many_damage_array.index(how_many_damage_array.max)].skill_datum.name}！ #{my_monster.name}に#{how_many_damage_array.max.round}のダメージ！"
        end
        redirect_to(battles_show_path(params[:my_id].to_i, params[:opponent_id].to_i))
      end
    end
  end
end
