class Genre < ApplicationRecord

	has_many :items, dependent: :destroy

	validates :name, presence: true
	validates :name, length: { in: 2..20 }
end
