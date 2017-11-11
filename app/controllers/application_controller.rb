class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  prepend_before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to(users_loginform_path)
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to(users_mypage_path)
    end
  end

  def super_user
    if @current_user.id != 1
      flash[:notice] = "あなたはこのページを閲覧することは出来ません"
      redirect_to(users_mypage_path)
    end
  end
end
