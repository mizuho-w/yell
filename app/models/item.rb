class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :item

	attachment :img
end
