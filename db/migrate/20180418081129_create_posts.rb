class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :comment, null: false
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
