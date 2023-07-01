class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    user = User.find(params[:user_id])
    posts = user.posts
    if posts
      render json: { status: 'Success', message: 'Loaded Posts', data: posts }, status: :ok
    else
      render json: { status: 'Not Found', message: 'Posts not found', data: posts.errors },
             status: :unprocessable_entity
    end
  end

  def show; end

  def create; end

  def update; end

  def destroy; end
end
