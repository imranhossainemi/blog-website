class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    @like = post.likes.new(author: current_user)
    if @like.save
      redirect_to likes_path(current_user, post)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
