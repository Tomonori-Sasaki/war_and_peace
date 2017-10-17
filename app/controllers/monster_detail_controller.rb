class MonsterDetailController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def synchronize
    MonsterDetail.all.destroy_all
    MonsterDatum.all.each do |monster_data|
      MonsterDetail.create(
        name: "#{monster_data.name}",
        hp_left: monster_data.hp,
        hp: monster_data.hp,
        attack: monster_data.attack,
        defence: monster_data.defence,
        speed: monster_data.speed,
        hp_add: monster_data.hp_add,
        attack_add: monster_data.attack_add,
        defence_add: monster_data.defence_add,
        speed_add: monster_data.speed_add,
        level: monster_data.level,
        exp: monster_data.exp,
        type: "#{monster_data.type}",
        user_id: 1,
        monster_datum_id: monster_data.id,
        having_flag: 1,
        have_flag: 1,
        had_flag: 1,
        seen_flag: 1)
    end

    SkillDetail.all.destroy_all
    MonsterDetail.all.each do |monster_detail|
      SkillDatum.all.each do |skill_data|
        SkillDetail.create(monster_detail_id: monster_detail.id, skill_datum_id: skill_data.id, pp_left: skill_data.pp)
      end
    end

    redirect_to(users_mypage_path)
  end

  def recovery
    @current_user.monster_detail.each do |monster_detail|
      monster_detail.hp_left = monster_detail.hp
      monster_detail.skill_detail.each do |skill|
        skill.pp_left = skill.skill_datum.pp
        skill.save
      end
      monster_detail.save
    end
    redirect_to(users_mypage_path)
  end

end
