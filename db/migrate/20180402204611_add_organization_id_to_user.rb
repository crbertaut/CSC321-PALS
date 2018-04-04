class AddOrganizationIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organization_id, :integer, optional: true, default: 0
  end
end
