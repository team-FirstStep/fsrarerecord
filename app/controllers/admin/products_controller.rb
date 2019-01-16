class Admin::ProductsController < Admin::ApplicationController
  # before_action :set_product

  def index

    @products = Product.page(params[:page]).reverse_order
  end

  def show

  end

  def new
    @product = Product.new
    @product.discs.build

  end

  def edit
  end

  def check

  end

  def updata
  end

  def create
    @product = current_admin.products.build(product_params)
    @product.save
  end

  def destroy
  end

  # def count
  #   cnt = Product.where(cd_title: '').count
  #   render text: "検索結果　#{cnt}件ヒットしました。"
end