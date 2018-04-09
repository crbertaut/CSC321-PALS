class AddAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :streetaddress, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end
end
