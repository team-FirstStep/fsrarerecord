class Admin::ProductsController < Admin::ApplicationController
  # before_action :set_product

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.discs.build
  end

  def edit
  end

  def check

  end

  def update
  end

  def create
        @product = Product.new(product_params)
        @product.admin_id = current_admin.id
        @product.save
        redirect_to new_admin_product_disc_path(@product.id)
  end

  def destroy
  end

  def search
    @products = Product.search(params[:search])
  end

  # def count
  #   cnt = Product.where(cd_title: '').count
  #   render text: "検索結果#{cnt}件ヒットしました。"
private
    def product_params
        params.require(:product).permit(:image,:artists, :cd_title, :price, :label, :genre, :stock)
    end

    end