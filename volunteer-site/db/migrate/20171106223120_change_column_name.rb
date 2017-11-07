class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :type, :thread_type
  end
end
