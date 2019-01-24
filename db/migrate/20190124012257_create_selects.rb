class CreateSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :selects do |t|
      t.integer :quantity
      t.integer :log_price
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
