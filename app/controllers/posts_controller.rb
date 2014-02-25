class PostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to :back, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @posts = Post.feed_posts(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:content, :recipient_id)
  end
end