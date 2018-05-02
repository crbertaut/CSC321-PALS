class AddDonatedToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :donated, :float, :default => 0
  end
end
