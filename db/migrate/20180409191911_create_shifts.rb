class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :kind, null: false
      t.datetime :start, null: false
      t.datetime :finish, null: false

      t.timestamps
    end
  end
end
