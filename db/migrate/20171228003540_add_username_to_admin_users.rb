class AddUsernameToAdminUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :username, :string
    remove_column :users, :username
    add_column :users, :username, :string
  end
end
