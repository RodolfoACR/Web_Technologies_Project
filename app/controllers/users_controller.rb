class UsersController < ApplicationController
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
    @user.build_profile # Esto ayuda a crear un nuevo perfil asociado al usuario en el formulario
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was succesffully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, profile_attributes: [:bio, :avatar_url, :username]
    )
  end
end
