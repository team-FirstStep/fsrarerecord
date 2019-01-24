class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :configure_sign_up_params, if: :devise_controller?

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, addresses_attributes: [:id, :address, :phone, :zip]])
  end

	def after_sign_in_path_for(resource)
		if current_user
			root_path
		else
			admin_products_path
		end
 	end

    def after_sign_out_path_for(resource)
    	root_path
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

      # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, addresses_attributes: [:id, :address, :phone, :zip]])

    end

private

    def current_cart

      Cart.find(session[:cart_id])

      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

end