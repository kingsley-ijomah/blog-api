class CreateMailingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :mailing_lists do |t|
      t.string :fullname, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
