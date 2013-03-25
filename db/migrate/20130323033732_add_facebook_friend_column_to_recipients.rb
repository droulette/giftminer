class AddFacebookFriendColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :fb_id, :string
  end
end
