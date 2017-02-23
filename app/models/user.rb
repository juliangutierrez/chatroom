class User < ApplicationRecord
	validates :name, presence: true

	has_many :messages

	YODA = 'yoda'
	VALLEY = 'valley'
end
