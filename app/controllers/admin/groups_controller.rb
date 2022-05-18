class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    # ユーザーの退会機能
    # @group.users.delete(current_user)
    redirect_to admin_groups_path, notice: "グループが削除されました。"
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  # def ensure_correct_user
  #   @group = Group.find(params[:id])
  #   unless @group.owner_id == current_user.id
  #     redirect_to groups_path
  #   end
  # end
end
