require 'cancancan'

class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.new(author: current_user, **comment_params)
    puts @comment
    puts comment_params
    puts @post
    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
