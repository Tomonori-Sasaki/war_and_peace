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
    MonsterDatum.all.each do |monster_data|
      MonsterDetail.where(monster_datum_id: monster_data.id).destroy_all
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
        tech1: monster_data.tech1,
        tech2: monster_data.tech2,
        tech3: monster_data.tech3,
        tech4: monster_data.tech4,
        type: "#{monster_data.type}",
        user_id: 1,
        monster_datum_id: monster_data.id,
        having_flag: 1,
        have_flag: 1,
        had_flag: 1,
        seen_flag: 1)
    end
    redirect_to(users_mypage_path)
  end

  def recovery
    @current_user.monster_detail.each do |monster_detail|
      monster_detail.hp_left = monster_detail.hp
      monster_detail.save
    end
    redirect_to(users_mypage_path)
  end

end
