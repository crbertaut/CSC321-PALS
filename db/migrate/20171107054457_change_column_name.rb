class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :type, :thread_type
  end
end
