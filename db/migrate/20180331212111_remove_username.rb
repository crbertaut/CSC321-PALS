class RemoveUsername < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username
    remove_column :admin_users, :username
  end
end
