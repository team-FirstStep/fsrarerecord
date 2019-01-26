class Admin::AddressesController < Admin::ApplicationController
	def edit
		@edit_address = Address.find(params[:user_id])
		@user = User.find(params[:id])
	end

	def update
		@edit_address = Address.find(params[:user_id])
		@user = User.find(params[:id])
		@edit_address.update(address_params)
		redirect_to admin_user_path(@user.id)
	end

	def destroy
		@edit_address =Address.find(params[:user_id])
		@edit_address.destroy
		@user = User.find(params[:id])
		redirect_to admin_user_path(@user.id)
	end

	private
	def address_params
		params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
			:add_zip, :add_address, :add_phone)
	end
end
