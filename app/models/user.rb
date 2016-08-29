class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :liked_posts, join_table: :user_post_likes, class_name: "Post"
  has_and_belongs_to_many :liked_comments, join_table: :user_comment_likes, class_name: "Comment"
  
  def likes_post?(post)
    return UserPostLike.exists?(user: self, post: post)
  end
  
  def likes_comment?(comment)
    return UserCommentLike.exists?(user: self, comment: comment)
  end
  
  def like_post(post)
    UserPostLike.create(user: self, post: post)
  end
  
  def unlike_post(post)
    UserPostLike.destroy_all(user: self, post: post)
  end
  
  def like_comment(comment)
    UserCommentLike.create(user: self, comment: comment)
  end
  
  def unlike_comment(comment)
    UserCommentLike.destroy_all(user: self, comment: comment)
  end
  
  validate :email_ends_with_tufts
  
  def email_ends_with_tufts
    if !(self.email.end_with?("@tufts.edu"))
      errors.add(:email, "Email does not end in @tufts.edu")
    end
  end
  
end
