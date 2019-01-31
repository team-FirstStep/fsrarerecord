class Public::ProductsController < Public::ApplicationController
  # before_action :set_product
  def index
    @products = Product.page(params[:page]).reverse_order
    @select = Select.new
    @ranks = Select.all.order('quantity desc').limit(5)
    product_select_count = Product.joins(:selects).group(:product_id).count
    product_selected_ids = Hash[product_select_count.sort_by{ |_, v| -v }].keys
    @product_ranking = Product.where(id: product_selected_ids)
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
    @selects = Select.all
  end

private
    def product_params
        params.require(:product).permit(:image_id,:artists, :cd_title, :price, :label, :genre, :stock, selects_attributes: [:quantity, :log_price])
    end

    def select_params
        params.require(:select).permit(:quantity, :log_price)
    end

end