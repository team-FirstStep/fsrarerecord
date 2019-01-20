class AddDiscNumToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :disc_num, :integer
  end
end
