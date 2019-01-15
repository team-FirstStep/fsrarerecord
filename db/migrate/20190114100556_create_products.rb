class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :admin_id
      t.string :artists
      t.string :cd_title
      t.text :jacket_img
      t.integer :price
      t.string :label
      t.integer :genre
      t.integer :stock
      t.integer :status
      t.datetime :created_at
      t.datetime :update_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
