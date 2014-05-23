class Photo < ActiveRecord::Base

	belongs_to :album
	default_scope -> { order('created_at DESC') }

	validates :album_id, presence: true
	validates :caption, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 150}
	
end
