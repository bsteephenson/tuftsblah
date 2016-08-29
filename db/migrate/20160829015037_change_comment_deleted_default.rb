class ChangeCommentDeletedDefault < ActiveRecord::Migration
  def up
    change_column_default :comments, :deleted, false
    Comment.update_all(deleted: false)
  end

  def down
    change_column_default :comments, :deleted, true
  end
end
