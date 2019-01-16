class Public::ApplicationController < ApplicationController

	# protect_from__forgery with: :exception

	private
	def current_cart
		@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end
end