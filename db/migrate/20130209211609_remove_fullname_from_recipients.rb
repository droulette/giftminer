class RemoveFullnameFromRecipients < ActiveRecord::Migration
  def up
    remove_column :recipients, :full_name
  end

  def down
    add_column  :recipients, :full_name, :string
  end
end
