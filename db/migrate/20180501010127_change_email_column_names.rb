class ChangeEmailColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :home_email, :email
    remove_column :users, :work_email
  end
end
