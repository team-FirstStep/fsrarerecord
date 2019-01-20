class Admin::SongsController < Admin::ApplicationController
  # before_action :set_song
  def index
    @songs = Song.all
  end

  def new
    @new_song = Song.new
    respond_to do |format|
      format.html
      format.js
    end
    # respond_to do |format|により.htmlと.jsの両方応答する
  end

  def create
    # disc = Disc.find(params[:disc_id])
    @new_song = Song.new(song_params)
    # @new_song.disc_id = disc.id
    respond_to do |format|
      if @new_song.save!
    @new_song.errors.full_messages
        format.html
        format.js
    @songs = Song.all
# 値を受け取って、saveに成功すればformat.jsに該当するcreate.js.erbが実行
      else
        format.js {render :new}
      end
    end
  end


  def edit
    @song = Song.find(params[:id])
  end

  def updata
    @song = Song.find(params[:id])
    @song.update
    redirect_to admin_product_path(@song.id)
  end

  # def destroy
  #   song = Song.find(params[:id])
  #   song.destroy
  #   redirect_to admin_products_path
  # end

private
  def song_params
    params.require(:song).permit(:song_no, :song_title)
  end

end