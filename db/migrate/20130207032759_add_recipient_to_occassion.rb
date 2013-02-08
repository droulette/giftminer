class AddRecipientToOccassion < ActiveRecord::Migration
  def change
    add_column :occassions, :recipient_id, :integer
    add_index :occassions, :recipient_id
  end
end
