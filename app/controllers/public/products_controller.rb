class Public::ProductsController < Public::ApplicationController
  # before_action :set_product

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
  end

  def search
  #ViewのFormで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
    @products2 = Product.page(params[:page]).reverse_order
  end

# private
#     def product_params
#         params.require(:product).permit(:image_id,:artists, :cd_title, :price, :label, :genre, :stock, discs_attributes: [:value])
#     end

end