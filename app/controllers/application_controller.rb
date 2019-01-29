class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :configure_sign_up_params, if: :devise_controller?

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zip, :address, :phone])
  end

	def after_sign_in_path_for(resource)
		if current_admin
			admin_products_path
		else
			root_path
		end
 	end

    def after_sign_out_path_for(resource)
    	root_path
 	end


  protect_from_forgery with: :exception
# <script> タグなどを使って意図に反して勝手にPOSTリクエストが送られてしまう可能性がある
# そのためprotect_from_forgery with: :exception をつける
  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create(user_id: current_user.id)  #@cart.user_id = current_user.id
      session[:cart_id] = @cart.id
    end
    return @cart
  end


protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:zip, :address, :phone, :last_name, :first_name, :email,
       :last_name_kana, :first_name_kana, :password, :password_confirmation])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:zip, :address, :phone, :last_name, :first_name,
       :email, :last_name_kana, :first_name_kana, :password, :password_confirmation])
	  end

      # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:zip, :address, :phone, :last_name, :first_name, :last_name_kana, :first_name_kana])
    end


end