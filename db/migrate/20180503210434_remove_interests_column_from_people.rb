class RemoveInterestsColumnFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :interests
  end
end
