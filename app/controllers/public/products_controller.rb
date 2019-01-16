class Public::ProductsController < Public::ApplicationController
  # before_action :set_product

  def index
  	@products = Product.all
  end

  def show
  end

  def search
  end

end