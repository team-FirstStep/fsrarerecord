class Admin::ProductsController < Admin::ApplicationController
  # before_action :set_product
before_action :authenticate_admin!
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
    @product = Product.find(params[:id])
  end

  def check

  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  def create
        @product = Product.new(product_params)
        @product.admin_id = current_admin.id
        if @product.save
        redirect_to new_admin_product_disc_path(@product.id)
      else
        render 'new'
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def search
    @products = Product.search(params[:search])
  end

  # def count
  #   cnt = Product.where(cd_title: '').count
  #   render text: "検索結果#{cnt}件ヒットしました。"
private
    def product_params
        params.require(:product).permit(:image, :artists, :cd_title, :price, :label, :genre, :stock, :status)
    end

end


