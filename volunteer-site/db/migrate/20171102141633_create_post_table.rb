class CreatePostTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string "title"
      t.string "type"
      t.text "description"
      t.datetime "date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
