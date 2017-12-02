class CreateInterestsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :interests, :users do |t|
      t.index :interest_id
      t.index :user_id
    end
  end
end
