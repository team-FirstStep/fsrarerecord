class ApplicationController < ActionController::Base


def after_sign_in_path_for(resource)
	if current_user
	    root_path
	else
		admin_products_path
	end
end
end