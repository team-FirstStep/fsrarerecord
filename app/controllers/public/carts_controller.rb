class Public::CartsController < Public::ApplicationController


  before_action :setup_select!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart = Cart.find(params[:id])
    # @selects = Select.find(current_cart.selects)
    # @selects = current_cart.selects
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    if @select.blank?
      @select = current_cart.selects.build(product_id: params[:product_id])
    end

    @select.quantity += params[:quantity].to_i
    @selects.save
    redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @select.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @select.destroy
    redirect_to current_cart
  end

  private

  def setup_select!
    @select = current_cart.selects.find_by(product_id: params[:product_id])
  end

	private

	def product_params
      params.require(:product).permit(:product_id, :cart_id)
    end
end