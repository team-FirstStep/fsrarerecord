class Public::ProductsController < Public::ApplicationController
  # before_action :set_product

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	# @songs = Songs.
  end

  def search
  end

end