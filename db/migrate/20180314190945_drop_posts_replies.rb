class DropPostsReplies < ActiveRecord::Migration[5.1]
  def change
    drop_table :posts
    drop_table :replies
  end
end
