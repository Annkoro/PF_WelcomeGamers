class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(10)
    @q = User.ransack(params[:q])
    @searches = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :caption, :profile_image, :gender, :gameid, :device, :voicechat, :playstyle, :playtime)
  end
end
