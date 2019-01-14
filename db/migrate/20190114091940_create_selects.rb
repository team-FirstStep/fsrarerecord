class CreateSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :selects do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :value_plan
      t.integer :log_price
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
