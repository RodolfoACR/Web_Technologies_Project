class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all.includes(:user)
  end

  def show
    @profile = Profile.find(params[:id])
    @posts = @profile.posts
    @followers = @profile.followers
  @following = @profile.following

  end
end
