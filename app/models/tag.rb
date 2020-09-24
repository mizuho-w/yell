class Tag < ApplicationRecord
	has_many :tag_relationships, dependent: :destroy
    has_many :items, through: :tag_relationships

    validates :name, presence: true
	validates :name, length: { in: 2..20 }
end
