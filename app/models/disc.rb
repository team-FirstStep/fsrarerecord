class Disc < ApplicationRecord
belongs_to :product
mount_uploader :product, ImageUploader
end
