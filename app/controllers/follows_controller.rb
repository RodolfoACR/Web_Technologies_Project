class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def create
    if current_user.profile != @profile && !current_user.profile.following.include?(@profile)
      current_user.profile.following << @profile
    end
    redirect_to profile_path(@profile)
  end

  def destroy
    if current_user.profile.following.include?(@profile)
      current_user.profile.following.destroy(@profile)
    end
    redirect_to profile_path(@profile)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
