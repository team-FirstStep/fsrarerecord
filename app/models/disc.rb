class Disc < ApplicationRecord
has_many :songs, dependent: :delete_all
#dependent: :delete_allは親が削除される際に子を一括で削除します。
accepts_nested_attributes_for :songs, allow_destroy: true

belongs_to :product, optional: true
end
