class AddDonatedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :donated, :float, :default => 0
  end
end
