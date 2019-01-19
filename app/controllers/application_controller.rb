class ApplicationController < ActionController::Base
	before_action :configure_sign_up_params, if: :devise_controller?


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, addresses_attributes: [:id, :address, :phone, :zip]])
  end
end