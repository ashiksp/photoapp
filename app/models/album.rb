class Album < ActiveRecord::Base

	default_scope -> { order('created_at DESC') }
	has_many :photos, dependent: :destroy
	
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 150}

	def photo_feed
		Photo.where("album_id = ?",id)
	end
	
end
