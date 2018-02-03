class AddUsernameToPostsAndReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :username, :string
    add_column :replies, :username, :string
  end
end
