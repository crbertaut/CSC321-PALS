class AddDefaultToUserContactMethod < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :contact_method, :integer, default: 0
  end
end
