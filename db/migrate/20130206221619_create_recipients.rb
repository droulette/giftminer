class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :age_range
      t.string :gender
      t.string :relationship

      t.timestamps
    end
    add_index :recipients, :user_id
  end
end
