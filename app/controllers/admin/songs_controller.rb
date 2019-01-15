class Admin::SongsController < Admin::ApplicationController
  # before_action :set_song

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def updata
    @song = Song.find(params[:id])
    @song.update
    redirect_to admin_product_path(@song.id)
  end

  def create
    @song = Song.new
    @song.save
    redirect_to admin_check_product_path(@song.id)
  end

  # def destroy
  #   song = Song.find(params[:id])
  #   song.destroy
  #   redirect_to admin_products_path
  # end

private
  def song_params
    params.require(:song).permit(:song_title)
  end

end