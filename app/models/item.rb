class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :user

	has_many :reservations, dependent: :destroy

	attachment :img
end
