class Public::OrdersController < Public::ApplicationController
  # before_action :set_order

  def create
      @user = current_user
      @cart = current_cart
      # ↓cartをsaveしてからでないと@select.cart_id = @cart.idが上手くいかず
      # 追記、sessionで保持しているからcart.saveいらない

      # ↓selectのsaveがバグってデータが入らない
      @order = Order.new(order_params)

      # binding.pry #←gem'pry'を立ち上げるやつ
      # @select.quantity = params["select"]["selects"]["quantity"].to_i
      @order.cart_id = @cart.id
  		@order.save
        session[:cart_id] = nil
  		redirect_to user_path(@user.id)
  end
    def order_params
      params.require(:order).permit(:log_last_name, :log_first_name, :log_last_name_kana, :log_first_name_kana, :log_zip, :log_address)
    end
end