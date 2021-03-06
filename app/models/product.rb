class Product < ApplicationRecord

  	attachment :image


	has_many :discs, dependent: :delete_all
	accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :songs
	accepts_nested_attributes_for :songs, allow_destroy: true

	acts_as_paranoid

	has_many :selects
	accepts_nested_attributes_for :selects, allow_destroy: true


	attachment :image

	before_destroy :referenced_by_select

    has_many :carts, through: :selects

    validates :artists, :cd_title, :price, presence: true

    def current_stock
    	stock - log_quantity
    end

    validates :stock, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
    #only_integer: trueを指定しないとgreater_than_or_equal_to:は発動しない


	private
	def referenced_by_select

		if selects.empty?
			return true
		else
			errors.add(:base, '品目が存在します。')

		end
	end

end
