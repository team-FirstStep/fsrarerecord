class Public::ProductsController < Public::ApplicationController
  # before_action :set_product

  def index
  	@products = Product.all
  end

  def show
  end

  def search
  #ViewのFormで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
  end

end