class RemoveSongNoFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_no, :integer
  end
end
