class Cart < ApplicationRecord
	has_many :selects
    has_many :products, through: :selects
	before_destroy :referenced_by_select

    has_one :order
    #carts : orders = 1 : 1 だがordersが外部キー(cart_id)を持つので
    #cartに対してorderは子(参照される側)になる！？よってhas_one
    #　1 : 1でも一応親子関係はある！！

	belongs_to :user

end
