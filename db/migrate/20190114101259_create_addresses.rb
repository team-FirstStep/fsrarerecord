class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :zip
      t.string :address
      t.string :phone
      t.string :add_zip
      t.string :add_address
      t.string :add_last_name
      t.string :add_first_name
      t.string :add_last_name_kana
      t.string :add_first_name_kana
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
