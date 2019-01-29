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
    # 商品一覧画面から、「商品購入」を押した時のアクション
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def check
    @cart = Cart.find(params[:id])
    @user = current_user
    @order = Order.new
  end

  def index
    @user = current_user
    @cart = Cart.where(user_id: @user)
    @order = Order.where(cart_id: @cart).order 'created_at desc'
<<<<<<< HEAD
    
    #仮でランキング？ここに作った↓viewはcarts_index
    @rank = Select.where(product_id: @order).order('product_id desc').limit(6)
    # @ranks = Select.group(:product).order('count_product_id desc').count(:product_id)
  end

  def rank
   
=======
            # created_at descで新しい順になる
>>>>>>> d73655b2cc219bfff7e9e270c936bc0d1855f63c
  end

	private

	def product_params
      params.require(:product).permit(:product_id, :cart_id)
  end
end