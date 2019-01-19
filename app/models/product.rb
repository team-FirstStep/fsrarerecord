class Product < ApplicationRecord
  attachment :image

<<<<<<< HEAD
has_many :selects
has_many :discs
accepts_nested_attributes_for :discs, allow_destroy: true
=======
	has_many :selects
	has_many :discs
	accepts_nested_attributes_for :discs


>>>>>>> 407b6d358753d52398bc975336c1a3270c21135f
end
