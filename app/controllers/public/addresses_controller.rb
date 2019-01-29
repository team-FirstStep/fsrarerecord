class Public::AddressesController < Public::ApplicationController
  before_action :correct_user_edit, only: [:edit, :update]
  before_action :correct_user_new, only: [:new]

    def correct_user_edit
		@edit_address = Address.find(params[:id])
		@edit_address.user_id = current_user
      if current_user != @user
      flash[:notice] = "権限がありません"
      redirect_to root_path
      end
    end

    def correct_user_new
		@add_address = Address.new
      if current_user != @user
      flash[:notice] = "権限がありません"
      redirect_to root_path
      end
    end

	def show
        @cart = Cart.find(params[:cart_id])
		@user = current_user
		@address = Address.find(params[:id])
        @order = Order.new
		# 追加アドレス先の選択後の購入確認画面に使用させていただいております。
	end

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