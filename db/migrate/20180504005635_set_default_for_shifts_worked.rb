class SetDefaultForShiftsWorked < ActiveRecord::Migration[5.1]
  def change
    remove_column :organizations, :shifts_worked
    add_column :organizations, :shifts_worked, :integer, default: 0
    remove_column :users, :type
  end
end
