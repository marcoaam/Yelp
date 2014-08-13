class Review < ActiveRecord::Base
	belongs_to :restaurant
	has_many :likes

	validates :rating, inclusion: (1..5)
end
