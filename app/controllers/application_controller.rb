class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
	if current_user
	    root_path
	else
		admin_products_path
	end
end



protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email,
       :last_name_kana, :first_name_kana, :password, :password_confirmation])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name,
       :email, :last_name_kana, :first_name_kana, :password, :password_confirmation])
    end
end