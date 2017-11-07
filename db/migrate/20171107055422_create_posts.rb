class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, force: true do |t|
      t.string :title
      t.string :thread_type
      t.text :description
      t.datetime :date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
