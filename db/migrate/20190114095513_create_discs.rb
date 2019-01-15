class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :product_id
      t.integer :value
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
