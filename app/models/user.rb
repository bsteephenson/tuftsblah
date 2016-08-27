class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
  has_and_belongs_to_many :liked_posts, join_table: :user_post_likes, class_name: "Post"
  has_and_belongs_to_many :liked_comments, join_table: :user_comment_likes, class_name: "Comment"
end
