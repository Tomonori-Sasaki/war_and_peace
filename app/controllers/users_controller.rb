class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :logout, :mypage, :practice, :boss, :communication, :settings]}
  before_action :level_judge, only: :mypage

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
  end

  def practice
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

  def level_up_exp_array
    n = 5
    exp_by_one_array = [5]
    exp_array = []
    for i in 1..1000 do
      n *= 1.1
      exp_by_one_array << n
    end
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
