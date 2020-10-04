class UsersController < ApplicationController
  before_action :check_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:firstname, :name, :email, :password, :profile_text,
                                 :password_confirmation, :profile_image, :cover_image)
  end
  def check_user
    unless logged_in?
      flash[:notice] = "ログインもしくはアカウントを作成してください"
      redirect_to new_session_url
    end
  end
end
