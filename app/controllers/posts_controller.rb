require 'cancancan'

class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(posts: [:author, { comments: [:author] }]).find(params[:id])
    @pagy, @posts = pagy(@user.posts, items: 4)
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: 'Post Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(current_user), notice: 'Post Deleted Successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
