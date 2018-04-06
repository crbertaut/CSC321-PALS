class AddInfoFormFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :phone, :home_phone
      t.rename :email, :home_email
      
      t.string :work_phone
      t.string :work_email
      t.integer :contact_method
      t.float :latitude
      t.float :longitude
      t.string :emergency_contact
      t.string :emergency_phone
      t.string :emergency_relationship
      t.string :emergency_phone_other
    end
  end
end
