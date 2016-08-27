class UserPostLike < ActiveRecord::Base
	has_one :user
	has_one :post
end
