class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
  def new
    @comment = Comment.new
  end

  def create
    puts 'Dheeraj'
    @post = Post.find(params[:id])
    @comment = @post.comments.new(author: current_user, **comment_params)
    puts @comment
    puts comment_params
    puts @post
    if @comment.save
      redirect_to posts_path(@post.author, @post), notice: 'Comment Created Successfully'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
