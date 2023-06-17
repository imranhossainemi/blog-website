require 'rails_helper'

describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', posts_counter: 0)
  post = Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                     comments_counter: 0)
  comment = Comment.new(author: user, post:)

  before { comment.save }

  it 'comment should increase user comment counter by 1' do
    expect(post.comments_counter).to eq(1)
    comment.update_comments_counter
    expect(post.comments_counter).to eq(2)
  end
end
