class Admin::CartsController < Admin::ApplicationController
  # before_action :set_cart

  def index
    @user = User.find(params[:user_id])
    @cart = Cart.where(user_id: @user)
    @order = Order.where(cart_id: @cart).order 'created_at desc'
            # created_at descで新しい順になる
  end

end