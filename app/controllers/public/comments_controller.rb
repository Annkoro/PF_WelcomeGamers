class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to post_path(@post.id)
  end

  def destroy
  Comment.find(params[:id]).destroy
  redirect_to
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
