class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :user

	has_many :reservation_informations, dependent: :destroy

	attachment :img
end
