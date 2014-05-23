class Album < ActiveRecord::Base

	default_scope -> { order('created_at DESC') }
	
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 150}

end
