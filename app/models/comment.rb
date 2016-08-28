class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :parent_comment, class_name: "Comment"
	has_many :children_comments, foreign_key: :parent_comment_id, class_name: "Comment"
	belongs_to :post
	
	def upvotes
		return UserCommentLike.where(comment: self).count
	end
	
end
