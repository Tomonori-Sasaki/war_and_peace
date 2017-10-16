class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :logout, :mypage, :practice, :boss, :communication, :settings]}
  before_action :level_judge, only: :mypage

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.ball_num = 5
    @user.level = 1
    @user.exp = 0
    @user.gold = 2000
    @user.last_login_at = Time.now
    @user.last_event_at = Date.today - 1
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to(users_mypage_path)
    else
      render(new_user_path)
    end
  end

  def show
  end

  def update
    if params[:user][:ball_num]
      @current_user.ball_num += params[:user][:ball_num].to_i
      @current_user.save
      redirect_to(users_mypage_path)
    end
  end

  def loginform
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.password == params[:user][:password]
        session[:user_id] = @user.id
        @user.last_login_at = Time.now
        @user.save
        flash[:notice] = "ログインしました"
        redirect_to(users_mypage_path)
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:user][:email]
        @password = params[:user][:password]
        render(users_loginform_path)
      end
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:user][:email]
      @password = params[:user][:password]
      render(users_loginform_path)
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def mypage
    # ずかん
    @zukan = MonsterDatum.all
    @monster = MonsterDetail.where(user_id: @current_user.id, have_flag: 1).order("having_flag DESC")
    if @current_user.level > 1
      @before_level_exp_sum = level_up_exp_array[@current_user.level-2].to_i
    else
      @before_level_exp_sum = 0
    end
    @next_level_exp = exp_by_one_array[@current_user.level-1].to_i
    @how_many_monsters = MonsterDetail.where(user_id: @current_user.id, had_flag: 1).pluck(:monster_datum_id).uniq.count
  end

  def practice
    @my_first_monster = @current_user.monster_detail.where(having_flag: 1).order("updated_at DESC").first
    @take_3_monsters_at_random_level_adjusted = []
    MonsterDatum.order("RANDOM()").limit(3).each do |monster|
      if @current_user.level-3 > 1
        monster.level = rand(@current_user.level-3..@current_user.level+3)
      else
        monster.level = rand(1..@current_user.level+3)
      end
      monster.hp += monster.hp_add*(monster.level-1)
      monster.attack += monster.attack_add*(monster.level-1)
      monster.defence += monster.defence_add*(monster.level-1)
      monster.speed += monster.speed_add*(monster.level-1)
      if monster.level > 1
        monster.exp = level_up_exp_array[monster.level-2].to_i
      else
        monster.exp = 0
      end
      monster = MonsterDetail.create(
        name: "#{monster.name}",
        hp_left: monster.hp,
        hp: monster.hp,
        attack: monster.attack,
        defence: monster.defence,
        speed: monster.speed,
        hp_add: monster.hp_add,
        attack_add: monster.attack_add,
        defence_add: monster.defence_add,
        speed_add: monster.speed_add,
        level: monster.level,
        exp: monster.exp,
        type: "#{monster.type}",
        user_id: 4,
        monster_datum_id: monster.id,
        having_flag: 1,
        have_flag: 1,
        had_flag: 1,
        seen_flag: 1)

      SkillDatum.order("RANDOM()").limit(3).each do |skill_data|
        SkillDetail.create(monster_detail_id: MonsterDetail.all.last.id, skill_datum_id: skill_data.id, pp_left: skill_data.pp)
      end

      @take_3_monsters_at_random_level_adjusted << monster
    end

    if @current_user.last_login_at > Date.today.beginning_of_day && @current_user.last_event_at < Date.today.beginning_of_day
      @eventmonster = MonsterDatum.order("RANDOM()").limit(1)[0]
      @eventmonster.level = @current_user.level + 10
      @eventmonster.hp += @eventmonster.hp_add*(@eventmonster.level-1)
      @eventmonster.attack += @eventmonster.attack_add*(@eventmonster.level-1)
      @eventmonster.defence += @eventmonster.defence_add*(@eventmonster.level-1)
      @eventmonster.speed += @eventmonster.speed_add*(@eventmonster.level-1)
      @eventmonster.exp = level_up_exp_array[@eventmonster.level-2].to_i
      @eventmonster = MonsterDetail.create(
        name: "#{@eventmonster.name}",
        hp_left: @eventmonster.hp,
        hp: @eventmonster.hp,
        attack: @eventmonster.attack,
        defence: @eventmonster.defence,
        speed: @eventmonster.speed,
        hp_add: @eventmonster.hp_add,
        attack_add: @eventmonster.attack_add,
        defence_add: @eventmonster.defence_add,
        speed_add: @eventmonster.speed_add,
        level: @eventmonster.level,
        exp: @eventmonster.exp,
        type: "#{@eventmonster.type}",
        user_id: 4,
        monster_datum_id: @eventmonster.id,
        having_flag: 1,
        have_flag: 1,
        had_flag: 1,
        seen_flag: 1)

      SkillDatum.order("RANDOM()").limit(3).each do |skill_data|
        SkillDetail.create(monster_detail_id: MonsterDetail.all.last.id, skill_datum_id: skill_data.id, pp_left: skill_data.pp)
      end
    end
  end

  def boss
  end

  def communication
  end

  def settings
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image_name, :password)
  end

  def exp_by_one_array
    n = 5
    array = [5]
    for i in 1..1000 do
      n *= 1.1
      array << n
    end
    return array
  end

  def level_up_exp_array
    exp_array = []
    for j in 0..1000 do
      exp_array << exp_by_one_array[0..j].sum
    end
    return exp_array
  end

  def level_judge
    while @current_user.exp > level_up_exp_array[@current_user.level-1] do
      @current_user.level += 1
      flash[:notice] = "#{@current_user.name}のトレーナーレベルがLv.#{@current_user.level}に上がった！"
    end
    @current_user.save
  end


end
