class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :status
      t.string :log_last_name
      t.string :log_first_name
      t.string :log_last_name_kana
      t.string :log_first_name_kana
      t.string :log_zip
      t.string :log_address
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
