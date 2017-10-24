class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :interests, :user, :user_id
  end
end
