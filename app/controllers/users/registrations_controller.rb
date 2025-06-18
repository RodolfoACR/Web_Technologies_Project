class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource
    resource.build_profile  # << ESTA LÍNEA ES CLAVE
    respond_with resource
  end
end
