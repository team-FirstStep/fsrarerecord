class Public::SelectsController < Public::ApplicationController

	 # before_action :set_select


	def index
    	@selects = Select.all
  	end

  	def new
  		@select = Select.new
  	end

	def create
      @user = current_user
      @cart = current_cart
      @select = Select.new(select_params)
      @select_product = @select.product
      @product = Product.find(@select_product.id)
      #↑作成した@selectに紐づくproductを引っ張ってきてる
      if @product.stock < @select.quantity
          flash[:notice] = "購入数が在庫数を超えています。"
          redirect_to product_path(@product.id)
      #↑在庫数が0以下になるのを防ぐ
      else
      @select.cart_id = @cart.id
  		@select.save
      @product.update(stock: @product.stock - @select.quantity)
      #モデル.update(カラム: 内容(文字列は""が必要))で
      #例：@user.update(name = "太郎")と同じ意味
  		redirect_to cart_path(@cart.id)
    end
    end

    def update
      @cart = current_cart
      @select = Select.find(params[:id])
      @select_product = @select.product
      @product = Product.find(@select_product.id)
      #↑updateした@selectに紐づくproductを引っ張ってきてる
      pass_quantity = @select.quantity
      #↑変更前のquantity
      @select.update(select_params)
      current_quantity = @select.quantity
      #↑変更後のquantity
      if @product.stock < (current_quantity - pass_quantity)
          flash[:notice] = "購入数が在庫数を超えています。"
          #↑在庫数が0以下になるのを防ぐ
      @select.update(quantity: pass_quantity)
          #↑変更されたquantityを変更前に戻す
          redirect_to cart_path(@cart.id)

      else
      @product.update(stock: @product.stock - (current_quantity - pass_quantity))
      redirect_to cart_path(@cart.id)
    end
    end
    # ↓誰かが書いていたのでとりあえず消さずに保留
   #  def update
   #  respond_to do |format|
   #    if @select.update(select_params)
   #      format.html { redirect_to @select, notice: 'Line item was successfully updated.' }
   #      format.json { render :show, status: :ok, location: @select }
   #    else
   #      format.html { render :edit }
   #      format.json { render json: @select.errors, status: :unprocessable_entity }
   #    end
   #    end
  	# end

  # カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart = current_cart
    @select = Select.find(params[:id])
    @select_product = @select.product
    @product = Product.find(@select_product.id)
    #↑updateした@selectに紐づくproductを引っ張ってきてる
    @product.update(stock: @product.stock + @select.quantity)
    #↑deleteする@selectが消える前に足す
    @select.destroy
    redirect_to cart_path(@cart.id)
  end

    # ↓誰かが書いていたのでとりあえず消さずに保留
  	# def destroy
   #  @select.destroy
   #  respond_to do |format|
   #    format.html { redirect_to selects_url, notice: 'Line item was successfully destroyed.' }
   #    format.json { head :no_content }
   #  end
  	# end
      # binding.pry #←gem'pry'を立ち上げるやつ
      # @select.quantity = params["select"]["selects"]["quantity"].to_i
private
  	# def set_select
   #    @select = Select.find(params[:id])
   #  end

    def select_params
      params.require(:select).permit(:product_id, :log_price, :quantity)
    end
end

