class Public::AddressesController < Public::ApplicationController

	def index
		@user = current_user
		@addresses = Address.where(user_id: @user)
	end

	def new
		@add_address = Address.new
	end

	def create
		@add_address = Address.new(address_params)
		@add_address.user_id = current_user.id
    	@add_address.save
    	redirect_to user_path(current_user)
	end

	def edit
<<<<<<< HEAD
		
=======

		@edit_address = Address.find(params[:id])
		@edit_address.user_id = current_user
>>>>>>> 9d47ab591a25601447500428641e4ad0d97b8bb1
	end

	def update
		@edit_address = Address.find(params[:id])
		@edit_address.update(address_params)
		redirect_to user_path(current_user)
	end

end

private
	def address_params
    	params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
      	:add_address, :add_zip)
  	end