class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, null: false
      t.references :user, null: false
      t.references :parent_comment
      t.text :content, null: false
      t.boolean :deleted, null: false, default: true

      t.timestamps null: false
    end
  end
end
