class Public::UsersController < Public::ApplicationController
  # before_action :set_user

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def edit
    @user = User.find(params[:id])
    # @addresses = @user.addresses
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana,
			:first_name_kana, :email, :profile_image,
			addresses_attributes: [:id, :address, :phone, :zip, :_destroy])
	end

end