class Product < ApplicationRecord

  	attachment :image


	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :songs
	accepts_nested_attributes_for :songs, allow_destroy: true

	acts_as_paranoid

	has_many :selects
	accepts_nested_attributes_for :selects, allow_destroy: true


	attachment :image

	before_destroy :referenced_by_select

    has_many :carts, through: :selects


	private
	def referenced_by_select

		if selects.empty?
			return true
		else
			errors.add(:base, '品目が存在します。')
			retuen false
		end
	end

end
