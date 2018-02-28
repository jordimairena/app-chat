class Users::RegistrosController < Devise::RegistrosController
  before_action :configure_sign_up_params, only: [:create]


  protected

  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usuario, :role_id, :password, :password_confirmation])
  end


end