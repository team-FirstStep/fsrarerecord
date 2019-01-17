class ApplicationController < ActionController::Base
	before_action :configure_sign_up_params, if: :devise_controller?

end