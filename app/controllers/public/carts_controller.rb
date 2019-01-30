class Public::CartsController < Public::ApplicationController
  # def current_cart
  #   if session[:cart_id]
  #     @cart = Cart.find(session[:cart_id])
  #   else
  #     @cart = Cart.create(user_id: current_user.id)  #@cart.user_id = current_user.id
  #     session[:cart_id] = @cart.id
  #   end
  # ーーーーーここまでApplicationControllerで定義ーーーーー
  before_action :correct_user, only: [:show, :check]
  before_action :authenticate_user!

    def correct_user
    @cart = Cart.find(params[:id])
    @order = Order.new
      if current_user.id != @cart.user_id
    # ↑current_userは.idをつけないと@cart.user_idと認識しない
      flash[:notice] = "権限がありません"
      redirect_to root_path
      end
    end

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
    # @ranks = Select.group(:product).order('count_product_id desc').count(:product_id)
  end

	private

	def product_params
      params.require(:product).permit(:product_id, :cart_id)
  end
end
