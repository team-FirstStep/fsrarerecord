class Public::ApplicationController < ApplicationController
	protect_from_forgery with: :exception

  	helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

	private
	def current_cart
		@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound #<= elseと同じ意味だと思う
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end
end