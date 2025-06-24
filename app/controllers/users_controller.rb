class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @favorite_posts = @user.favorite_posts
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was succesffully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
    @favorite_posts = @user.favorite_posts
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User & profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User and profile successfully deleted."
  end

  private

  def user_params
    permitted = [ :email ]
    permitted << :password unless params[:user][:password].blank?
    permitted << :password_confirmation unless params[:user][:password_confirmation].blank?

    params.require(:user).permit(permitted, profile_attributes: [ :id, :username, :bio ])
  end
end
