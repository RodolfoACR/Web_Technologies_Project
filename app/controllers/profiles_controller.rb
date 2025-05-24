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

  def new
    @profile = Profile.new
  end

  private

    def profile_params
    params.require(:profile).permit(
      :username, :bio, :avatar_url
    )
  end
end
