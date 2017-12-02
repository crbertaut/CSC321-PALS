class RemoveInterestsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :interests, :user_id
  end
end
