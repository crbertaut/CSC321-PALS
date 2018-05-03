class RestructureUserBasedTables < ActiveRecord::Migration[5.1]
  def change
    # Setup new 'Persons' table
    create_table :persons do |t|
      t.string :home_phone
      t.string :work_phone
      t.date :dob
      t.text :interests
      t.integer :gender, default: 3
      t.string :other_gender
      t.string :emergency_contact
      t.string :emergency_phone
      t.string :emergency_relationship
      t.string :emergency_phone_other
      t.integer :organization_id, default: 0
    end
    
    # Update 'Organizations' table
    add_column :organizations, :phone, :string
    add_column :organizations, :shifts, :integer
    remove_column :organizations, :created_at
    remove_column :organizations, :updated_at
    
    # Update 'Users' table
    remove_column :users, :home_phone
    remove_column :users, :dob
    remove_column :users, :interests
    remove_column :users, :gender
    remove_column :users, :other_gender
    remove_column :users, :emergency_contact
    remove_column :users, :emergency_phone
    remove_column :users, :emergency_relationship
    remove_column :users, :emergency_phone_other
    remove_column :users, :organization_id
    remove_column :users, :work_phone
    change_table :users do |t|
      t.actable
    end
    
    # Update 'Donations' table
    remove_column :donations, :organization_id
    
    # Replace interests_users join table with interests_persons join table
    drop_table :interests_users
    create_join_table :interests, :persons do |t|
      t.index :interest_id
      t.index :person_id
    end
    
    # Update 'Shifts' table
    remove_column :shifts, :user_id
    add_column :shifts, :person_id, :integer
    add_index :shifts, :person_id
  end
end
