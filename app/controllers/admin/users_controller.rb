class Admin::UsersController < Admin::ApplicationController
  # before_action :set_user

  def index
    @users = User.where("email LIKE(?)", "%#{params[:keyword]}%")
  end

  def show
  end

  def edit
  end

  def updata
  end

  def destroy
  end

end