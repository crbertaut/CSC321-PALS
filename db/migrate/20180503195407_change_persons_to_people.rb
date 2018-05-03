class ChangePersonsToPeople < ActiveRecord::Migration[5.1]
  def change
    # Apparently Rails is too smart for its own good. Let's try a 'People' table
    drop_table :persons
    create_table :people do |t|
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
  end
end
