class CreateUserPostLikes < ActiveRecord::Migration
  def change
    create_table :user_post_likes do |t|
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps null: false
    end
  end
end
