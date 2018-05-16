class AddDefaultToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :shifts, :integer, default: 0
  end
end
