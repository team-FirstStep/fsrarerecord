class Product < ApplicationRecord
  attachment :image

has_many :selects
has_many :discs
accepts_nested_attributes_for :discs, allow_destroy: true
acts_as_paranoid
end
