class AddFullNameToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :full_name, :string
    add_index :recipients, :full_name
  end
end
