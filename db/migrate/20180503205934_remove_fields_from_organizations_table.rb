class RemoveFieldsFromOrganizationsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :organizations, :name
    remove_column :organizations, :donated
    remove_column :organizations, :email
    remove_column :organizations, :shifts
    add_column :organizations, :shifts_worked, :integer
  end
end
