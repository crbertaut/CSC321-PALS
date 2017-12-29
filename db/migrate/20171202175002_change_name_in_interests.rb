class ChangeNameInInterests < ActiveRecord::Migration[5.1]
  def change
    change_column :interests, :name, :string, unique: true
  end
end
