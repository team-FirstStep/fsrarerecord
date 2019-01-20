class AddSongTrackToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :song_track, :integer
  end
end
