class Public::OrdersController < Public::ApplicationController
  before_action :correct_user, only: [:create]
  before_action :authenticate_user!

    def correct_user
    @cart = current_cart
    @order = Order.new(order_params)
      if current_user.id != @cart.user_id
    # ↑current_userは.idをつけないと@cart.user_idと認識しない
      flash[:notice] = "権限がありません"
      redirect_to root_path
      end
    end

  def create
    @user = current_user
    @cart = current_cart
      # ↓cartをsaveしてからでないと@select.cart_id = @cart.idが上手くいかず
      # 追記、sessionで保持しているからcart.saveいらない

      # ↓selectのsaveがバグってデータが入らない
    @order = Order.new(order_params)
    @order.build_cart
      # binding.pry #←gem'pry'を立ち上げるやつ
      # @select.quantity = params["select"]["selects"]["quantity"].to_i
    @order.cart_id = @cart.id
    @order.save
    session[:cart_id] = nil
    redirect_to carts_path
  end
  def order_params
    params.require(:order).permit(:log_last_name, :log_first_name, :log_last_name_kana, :log_first_name_kana, :log_zip, :log_address, :log_quantity)
  end
end