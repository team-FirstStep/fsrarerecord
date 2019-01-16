class SelectsController < ApplicationController


	def create

		@cart = current_cart

		product = Product.find(params[:product_id])

		@select = @cart.selects.build(product: product)

    	respond_to do |format|
	      if @select.save
	        format.html { redirect_to @select.cart, notice: 'カートに商品が追加されました。' }
	        format.json { render :show, status: :created, location: @select }
	      else
	        format.html { render :new }
	        format.json { render json: @select.errors, status: :unprocessable_entity }
	      end
    	end
	end


end
