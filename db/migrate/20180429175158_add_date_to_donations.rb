class AddDateToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :date, :date
  end
end
