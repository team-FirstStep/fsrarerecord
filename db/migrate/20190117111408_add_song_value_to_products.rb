class AddSongValueToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :song_value, :integer
  end
end
