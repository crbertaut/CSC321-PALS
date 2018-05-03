class ReplaceInterestsPersonsWithInterestsPeople < ActiveRecord::Migration[5.1]
  def change
    # WAY too smart for its own good.
    # Replace interests_persons join table with interests_people join table
    drop_table :interests_persons
    create_join_table :interests, :people do |t|
      t.index :interest_id
      t.index :person_id
    end
  end
end
