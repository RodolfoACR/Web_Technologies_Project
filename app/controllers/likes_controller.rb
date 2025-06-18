# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    profile = current_user.profile
    post.likes.create!(profile: profile)
    redirect_back fallback_location: root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(profile: current_user.profile)
    like&.destroy
    redirect_back fallback_location: root_path
  end
end
