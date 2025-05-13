class PostsController < ApplicationController
  def index
    @posts = Post.includes(:profile, :hashtags).all
  end

  def show
    @post = Post.find(params[:id])
  end
end
