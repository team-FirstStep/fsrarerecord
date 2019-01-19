class AddSongValueToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :song_value, :integer
  end
end
