class FixBullshit < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :phone, :string

    add_index :shifts, :user_id
    
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :integer, default: 3
    add_column :users, :other_gender, :string
    add_column :users, :emergency_contact, :string
    add_column :users, :emergency_phone, :string
    add_column :users, :emergency_relationship, :string
    add_column :users, :emergency_phone_other, :string
    add_column :users, :organization_id, :integer, default: 0
    
    add_index :organizations, :reset_password_token, unique: true
    add_index :organizations, :confirmation_token,   unique: true
    add_index :organizations, :email, unique: true
    
    add_column :donations, :organization_id, :integer
    add_index :donations, :organization_id
  end
end
