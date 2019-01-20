class Public::ApplicationController < ApplicationController
	protect_from_forgery with: :exception

  	helper_method :current_cart

end