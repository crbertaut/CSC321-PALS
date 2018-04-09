class RemoveUnnecessaryFieldsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :econtactname
    remove_column :users, :econtactphone
    remove_column :users, :econtactphonealt
    remove_column :users, :econtactrelationship
    remove_column :users, :streetaddress
    add_column :users, :street_address, :string
  end
end
