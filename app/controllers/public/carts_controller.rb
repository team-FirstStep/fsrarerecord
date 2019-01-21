class Public::CartsController < Public::ApplicationController


	def index
		@selects = Select.page(params[:page]).reverse_order
	end


	def create
		# @cart = current_cart

		# product = Product.find(params[:products_id])

		# @select = @cart.selects.build(product: product)

		# respond_to do |format|
  #     if @select.save
  #       format.html { redirect_to @select.cart, notice: 'カートに商品が追加されました。' }
  #       format.json { render :show, status: :created, location: @select }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @select.errors, status: :unprocessable_entity }
  #     end
  #     end

	end

  	# def set_select
  	# 	@product = Product.find(params[:id])
  	# 	@user = current_user.id
  	# 	@cart = Cart.find_or_create_by(user_id: @user)
  	# 	@cart.user_id = current_user.id
  	# 	@select = Select.new
  	# 	@select.product_id = @product.id
  	# 	@select.cart_id = @cart.id
  	# 	@select.save
  	# 	redirect_to root_path
   #  end

	private

	def product_params
      params.require(:product).permit(:product_id, :cart_id)
    end
end