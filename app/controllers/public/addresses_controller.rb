class Public::AddressesController < Public::ApplicationController

	def index
		@user = current_user
		# @addresses = Address.where(user_id: @user)
	end

	def new
		@add_address = Address.new
	end

	def create
		@user = current_user
		@add_address = Address.new(address_params)
		@add_address.user_id = current_user.id
		# @add_address.user_id = @user.id
    	@add_address.save!
    	@add_address.errors.full_messages
    	redirect_to user_addresses_path(current_user)
	end

	def edit
		@edit_address = Address.find(params[:id])
		@edit_address.user_id = current_user
	end

	def update
		@edit_address = Address.find(params[:id])
		@edit_address.update(address_params)
		redirect_to user_addresses_path(current_user)
	end

	def destroy
		@addresses = Address.find(params[:id])
		@addresses.destroy
		redirect_to user_addresses_path(current_user)
	end


private
	def address_params
    	params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
      	:add_address, :add_zip, :add_phone)
  	end
end