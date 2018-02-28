class Users::RegistrationsController < Devise::RegistrosController
  before_action :configure_sign_up_params, only: [:create]
  layout 'public'
  

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usuario, :role_id, :password, :password_confirmation, :email])
  end

end