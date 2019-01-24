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
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
      # ↓cartをsaveしてからでないと@select.cart_id = @cart.idが上手くいかず
      # ↓selectのsaveがバグってデータが入らない
      @select = Select.new(select_params)
      #binding.pry←gem'pry'を立ち上げるやつ
      # @select.quantity = params["select"]["selects"]["quantity"].to_i
      @select.cart_id = @cart.id
  		@select.save
  		redirect_to cart_path(@cart.id)
    end

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
      params.require(:select).permit(:product_id, :log_price, selects_attributes: [:quantity])
    end
end
