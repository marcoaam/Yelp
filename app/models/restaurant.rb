class Restaurant < ActiveRecord::Base
	has_many :reviews

	validates :name, length: { minimum: 3, maximum: 50 }, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
		reviews.average(:rating)
	end

end
