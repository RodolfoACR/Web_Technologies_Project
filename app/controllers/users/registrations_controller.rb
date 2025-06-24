class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  def new
    build_resource
    resource.build_profile  # Necesario para que `fields_for :profile` funcione en el formulario
    respond_with resource
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email, :password, :password_confirmation,
      profile_attributes: [ :username, :bio, :avatar_url ]
    ])
  end
end
