class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :tag
	has_many :comments
	
	def upvotes
		return UserPostLike.where(post: self).count
	end
	
end
