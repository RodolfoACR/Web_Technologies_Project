class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all.includes(:user)
  end

  def show
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

  def create
    @profile = Profile.new(profile_params)
    @profile.user = User.first
    if @profile.save
      redirect_to @profile, notice: "Profile created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path, notice: "Profile deleted successfully."
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :bio, :avatar_url)
  end
end
