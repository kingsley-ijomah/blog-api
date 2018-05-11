class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :fullname, null: false
      t.string :email, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
