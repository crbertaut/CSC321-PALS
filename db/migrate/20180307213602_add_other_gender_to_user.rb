class AddOtherGenderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :other_gender, :string
  end
end
