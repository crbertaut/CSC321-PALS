class AddIndexToUsersPhone < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :phone, unique: true
  end
end
