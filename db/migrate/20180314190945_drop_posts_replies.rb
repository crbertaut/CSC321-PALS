class DropPostsReplies < ActiveRecord::Migration[5.1]
  def change
    drop_table :replies
    drop_table :posts
  end
end
