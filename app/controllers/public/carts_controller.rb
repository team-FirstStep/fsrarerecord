class Public::CartsController < Public::ApplicationController
  before_action :setup_select!

  def show
    @selects = current_cart.selects
  end

  def add_item
    if @select.blank?
      @select = current_cart.selects.build(product_id: params[:product_id])
    end

    @select.quantity += params[:quantity].to_i
    @select.save
    redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @select.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def create
  end

  def destroy
    @select.destroy
    redirect_to current_cart
  end


private

  def setup_select!
    @select = current_cart.selects.find_by(product_id: params[:product_id])
  end

end