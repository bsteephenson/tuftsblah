class UserCommentLike < ActiveRecord::Base
	has_one :user
	has_one :comment
end
