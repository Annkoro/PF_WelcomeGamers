class Public::PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_top_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end




  private

  def post_params
    params.require(:posts).permit(:title, :caption)
  end

end
