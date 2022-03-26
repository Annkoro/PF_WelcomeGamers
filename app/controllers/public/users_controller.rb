class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)

    @q = User.ransack(params[:q])

    if params[:q].blank? || params[:q][:name_cont].blank? # true/false
      @searches = nil
    else
      @searches = @q.result(distinct: true)
    end
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
    redirect_to user_path(@user.id), notice: "プロフィールが更新されました。"
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "GuestUser"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
