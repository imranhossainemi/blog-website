require 'rails_helper'

describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
  post1 = Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                      comments_counter: 0)
  like = Like.new(author: user, post: post1)

  before { like.save }

  it 'likes counter update' do
    expect(post1.likes_counter).to eq(1)
    like.update_likes_counter
    expect(post1.likes_counter).to eq(2)
  end
end
