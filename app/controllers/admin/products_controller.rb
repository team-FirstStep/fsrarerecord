class Admin::ProductsController < Admin::ApplicationController
  # before_action :set_product

  def index

    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.show(params[:id])
    @songs =
  end

  def new
    @product = Product.new
    @product.discs.build
  end

  def edit
  end

  def updata
  end

  def create
    @product = Product.new(product_params)
    @product = current_admin.product.build(product_params)
    @product.save
    redirect_to new_admin_product_path
  end

  def destroy
  end
# private

#     def post_image_params
#         params.require(:product).permit(:image)
#     end
  # def count
  #   cnt = Product.where(cd_title: '').count
  #   render text: "検索結果　#{cnt}件ヒットしました。"
end