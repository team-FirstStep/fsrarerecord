class Admin::ProductsController < Admin::ApplicationController
  # before_action :set_product

  def index
  end

  def show
    @product = Product.show(params[:id])
    @songs =
  end

  def new
  end

  def edit
  end

  def updata
  end

  def create
  end

  def destroy
  end

  # def count
  #   cnt = Product.where(cd_title: '').count
  #   render text: "検索結果　#{cnt}件ヒットしました。"
end