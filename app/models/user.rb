class User < ApplicationRecord
	validates :name, presence: true

	has_many :messages

	PIRATE = 'pirate'
	YODA = 'yoda'
	VALLEY = 'valley'
end
