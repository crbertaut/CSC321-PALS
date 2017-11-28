class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
