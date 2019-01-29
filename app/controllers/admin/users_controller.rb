class Admin::UsersController < Admin::ApplicationController
  # before_action :set_user
before_action :authenticate_admin!
  def index
    # @users = User.where("email LIKE(?)", "%#{params[:keyword]}%")
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @address = Address.find(@user.id)
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.find_by(user_id: @user.id)
    # @user.addresses.build
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  # def destroy
  #   @user =User.find(params[:id])
  #   @user.destroy
  #   redirect_to admin_user_path(@user.id)
  # end

private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
     :email, :address, :phone, :zip)
     # address_attiribute:[:add_last_name, :add_first_name,
     # :add_last_name_kana, :add_first_name_kana, :add_address, :add_zip, :add_phone])
  end
  # def address_params
  #   params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
  #     :add_address, :phone, :add_zip, :address, :zip, :add_phone)
  # end
end