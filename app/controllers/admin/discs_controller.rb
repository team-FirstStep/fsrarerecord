class Admin::DiscsController < Admin::ApplicationController
# productsの子
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

  def edit
    @product = Product.find(params[:product_id])
    @disc = Disc.find(params[:id])
    @song = Song.find(@disc.id)
  end

  def update
    @product = Product.find(params[:product_id])
    # @disc = Disc.find(params[:id]) ←discの値を変更しないので要らない
    @song = Song.find(params[:song][:song_id])
    # ↑@song = Song.find(params[:song][:song_id])は
    # @song = Song.find(song_params)
    #     def song_params
    #     params.require(:song).permit(:song_id)
    # とほぼ同じ意味   今回はf.hidden_fieldで値を渡しているので直接[:song][:song_id]
    @song.update(song_params)
    redirect_to admin_product_path(@product.id)
  end


private
    def disc_params
        params.require(:disc).permit(:value, :disc_num, songs_attributes: [:song_track, :song_title])
    end

    def song_params
        params.require(:song).permit(:song_track, :song_title)
    end

    end