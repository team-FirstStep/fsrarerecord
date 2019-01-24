class Public::ProductsController < Public::ApplicationController
  # before_action :set_product

  def index
    @products = Product.page(params[:page]).reverse_order
    @select = Select.new

  end

  def show
    @product = Product.find(params[:id])
    @select = Select.new
    @product.selects.build
  end

  def create

  end

  def search
  #ViewのFormで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
    @products2 = Product.page(params[:page]).reverse_order
    @select = Select.new
  end

private
    def product_params
        params.require(:product).permit(:image_id,:artists, :cd_title, :price, :label, :genre, :stock, selects_attributes: [:quantity, :log_price])
    end

    def select_params
        params.require(:select).permit(:quantity, :log_price)
    end

end