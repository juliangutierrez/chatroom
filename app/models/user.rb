class User < ApplicationRecord
	after_create :set_active

	validates :name, presence: true

	has_many :messages

	PIRATE = 'pirate'
	YODA = 'yoda'
	VALLEY = 'valley'

	def set_active
		update active: true
	end

end
