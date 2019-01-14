class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.integer :song_no
      t.string :song_title
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
