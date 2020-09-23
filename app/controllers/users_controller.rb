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
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:firstname, :name, :email, :password,
                                 :password_confirmation)
  end
  def check_user
    unless logged_in?
      flash[:notice] = "ログインもしくはアカウントを作成してください"
      redirect_to new_session_url
    end
  end
end
