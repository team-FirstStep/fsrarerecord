class Public::UsersController < Public::ApplicationController
  # before_action :set_user

  def show
    @user = User.find(params[:id])
    # @address = Address.find_by(user_id: @user.id)

  end

  def edit
    @user = User.find(params[:id])
    # @user.addresses.build
    #@address = Address.find_by(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # @address = Address.find_by(user_id: @user.id)
    # @address.update(address_params)
    redirect_to user_path(@user.id)
  end

private
	def user_params
		params.require(:user).permit(:zip, :address, :phone, :last_name, :first_name, :last_name_kana, :first_name_kana, :email)
			# addresses_attributes: [:id, :add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
       # :address, :phone, :zip, :add_address, :add_zip, :add_phone, :_destroy])
	end
  # def address_params
  #   params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
  #     :add_address, :add_zip, :add_phone)
  # end


end