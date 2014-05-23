class Photo < ActiveRecord::Base

	belongs_to :album
	default_scope -> { order('created_at DESC') }

	has_attached_file :pic, :styles => { :medium => "300x300", :thumb => "100x100" }
	validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

	validates :album_id, presence: true
	validates :pic, presence: true
	validates :caption, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 150}
	
end
