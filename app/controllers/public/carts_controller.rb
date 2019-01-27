class Public::CartsController < Public::ApplicationController
  # def current_cart
  #   if session[:cart_id]
  #     @cart = Cart.find(session[:cart_id])
  #   else
  #     @cart = Cart.create(user_id: current_user.id)  #@cart.user_id = current_user.id
  #     session[:cart_id] = @cart.id
  #   end
  # ーーーーーここまでApplicationControllerで定義ーーーーー

  def show
    @cart = Cart.find(params[:id])
    @user = current_user
    # @selects = Select.find(current_cart.selects)
    # @selects = current_cart.selects
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def check
    @cart = Cart.find(params[:id])
    @user = current_user
    @order = Order.new
  end





	private

	def product_params
      params.require(:product).permit(:product_id, :cart_id)
    end
end