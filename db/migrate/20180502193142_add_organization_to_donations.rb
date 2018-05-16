class AddOrganizationToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :organization_id, :integer, index: true
  end
end
