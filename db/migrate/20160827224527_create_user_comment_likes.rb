class CreateUserCommentLikes < ActiveRecord::Migration
  def change
    create_table :user_comment_likes do |t|
      t.references :user, null: false
      t.references :comment, null: false

      t.timestamps null: false
    end
  end
end
