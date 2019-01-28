class Order < ApplicationRecord
   belongs_to :cart
#carts : orders = 1 : 1 だがordersが外部キー(cart_id)を持つので
#cartに対してorderは子(参照される側)になる！？よってbelong_to
#　1 : 1でも一応親子関係はある！！
end
