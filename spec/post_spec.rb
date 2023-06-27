require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', posts_counter: 0)
  post = Post.new(author: user, title: 'post1', text: 'This is my first Post', comments_counter: 0, likes_counter: 0)
  post1 = Post.new(author: user,
                   title: 'Testing Testing Testing Testing Testing Testing Testing Testing
                   Testing Testing Testing Testing Testing Testing Testing Testing Testing
                   Testing Testing Testing Testing Testing Testing Testing Testing Testing
                   Testing Testing Testing Testing Testing Testing Testing Testing Testing
                   Testing Testing Testing Testing ', text: 'This is my first Post',
                   comments_counter: 0, likes_counter: 0)

  before { post.save }

  it 'author' do
    post.author = nil
    expect(post).to_not be_valid
  end

  it 'title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title greater than 250 characters' do
    post.title = 'Testing Testing Testing Testing Testing Testing Testing Testing
    Testing Testing Testing Testing Testing Testing Testing Testing Testing
    Testing Testing Testing Testing Testing Testing Testing Testing Testing
    Testing Testing Testing Testing Testing Testing Testing Testing Testing
    Testing Testing Testing Testing '
    expect(post1).to_not be_valid
  end

  it 'comments counter' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'likes counter' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'five recent comments' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                       comments_counter: 0)
    Comment.create(author: user, post:, text: 'This is my first comment')
    Comment.create(author: user, post:, text: 'This is my second comment')
    Comment.create(author: user, post:, text: 'This is my third comment')
    Comment.create(author: user, post:, text: 'This is my fourth comment')
    Comment.create(author: user, post:, text: 'This is my fifth comment')

    expect(post.recent_comments.size).to eq(5)
    expect(post.recent_comments[0].text).to eq('This is my fifth comment')
    expect(post.recent_comments[1].text).to eq('This is my fourth comment')
  end

  it 'post counter update' do
    expect(user.posts_counter).to eq(1)
    post.update_post_counter
    expect(user.posts_counter).to eq(2)
  end
end
