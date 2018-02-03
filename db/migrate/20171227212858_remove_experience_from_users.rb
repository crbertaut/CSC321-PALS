class RemoveExperienceFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :experience
  end
end
