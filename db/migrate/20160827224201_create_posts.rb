class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :tag
      t.references :user, null: false
      t.boolean :deleted, null:false, default: false

      t.timestamps null: false
    end
  end
end
