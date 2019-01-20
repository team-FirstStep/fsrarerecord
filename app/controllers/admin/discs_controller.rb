class Admin::DiscsController < Admin::ApplicationController
  def new
  @product = Product.find(params[:product_id])
  @disc = @product.discs.build
  end

  def create
     @product = Product.find(params[:product_id])
     @disc = Disc.new(disc_params)
     @disc.product_id = @product.id
     @disc.save!
     redirect_to new_admin_product_disc_song_path(@product.id, @disc.id)
  end

private
    def disc_params
        params.require(:disc).permit(:disc_num)
    end

    end