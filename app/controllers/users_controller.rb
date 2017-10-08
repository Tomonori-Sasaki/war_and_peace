class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :logout, :mypage, :practice, :boss, :communication, :settings]}

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


end
