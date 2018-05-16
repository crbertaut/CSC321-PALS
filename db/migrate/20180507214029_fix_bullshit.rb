class FixBullshit < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :phone, :string
  end
end
