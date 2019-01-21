class Public::SelectsController < ApplicationController

	 # before_action :set_select


	def index
    	@selects = Select.all
  	end

  	def new
  		@select = Select.new
  	end

	def create
  		@user = current_user.id
  		@cart = Cart.find_or_create_by(user_id: @user)
  		@select = Select.new(product_id: params[:select][:product_id])
  		# @select.product_id = @product.id
  		@select.cart_id = @cart.id
  		@select.save
  		redirect_to root_path
    end

 #  	def create
 #  		@cart = current_cart

	# 	product = Product.find(params[:product_id])

	# 	@select = @cart.selects.build(product: product)

	# 	respond_to do |format|
 #      if @select.save
 #        format.html { redirect_to @select.cart, notice: 'カートに商品が追加されました。' }
 #        format.json { render :show, status: :created, location: @select }
 #      else
 #        format.html { render :new }
 #        format.json { render json: @select.errors, status: :unprocessable_entity }
 #      end
 #      end
	# end

    def update
    respond_to do |format|
      if @select.update(select_params)
        format.html { redirect_to @select, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @select }
      else
        format.html { render :edit }
        format.json { render json: @select.errors, status: :unprocessable_entity }
      end
      end
  	end

  	def destroy
    @select.destroy
    respond_to do |format|
      format.html { redirect_to selects_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  	end

private
  	# def set_select
   #    @select = Select.find(params[:id])
   #  end

    def select_params
      params.require(:select).permit(:product_id, :cart_id, :value_plan, :log_price,)
    end
end
