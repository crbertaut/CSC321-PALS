class RemoveInterestsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :interests
  end
end
