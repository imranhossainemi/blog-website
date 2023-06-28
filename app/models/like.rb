class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end

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
