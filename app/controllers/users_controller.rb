class UsersController < ApplicationController
  before_action :check_user, only: [:show, :edit, :update]

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

  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = current_user.favorite_blogs.all
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :name, :email, :password, :profile_text,
                                 :password_confirmation, :profile_image)
  end

  def check_user
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash[:notice] = "編集権限がありません"
      redirect_to blogs_path
    end
  end

end
