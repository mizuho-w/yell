class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :user

	has_many :reservations, dependent: :destroy
	has_many :favorites, dependent: :destroy

	attachment :img

	has_many :tag_relationships, dependent: :destroy
    has_many :tags, through: :tag_relationships

    attr_accessor :tag_name

    validates :name, presence: true
    validates :explanation, presence: true
    validates :explanation, length: { maximum: 600 }
    validates :distribute_date, presence: true
    validates :distribute_date_fin, presence: true

	def save_tag(sent_tags)
		current_tags = self.tags.pluck(:name) unless self.tags.nil?
		old_tags = current_tags - sent_tags
		new_tags = sent_tags - current_tags

		old_tags.each do |old|
			self.tags.delete Tag.find_by(name: old)
		end

		new_tags.each do |new|
			new_post_tag = Tag.find_or_create_by(name: new)
			self.tags << new_post_tag
		end
	end

	def favorited_by?(user)
   	favorites.where(user_id: user.id).exists?
   end
   
end
