class CreateInterestsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :interests_users
    create_join_table :interests, :users do |t|
      t.index :interest_id
      t.index :user_id
    end
  end
end
