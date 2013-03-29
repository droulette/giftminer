class AddFriendBirthdayToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :birthday, :date
  end
end
