class AddFacebookColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :fb_url, :string
    add_column :users, :location, :string
    add_column :users, :timezone, :integer
    add_column :users, :locale, :string
  end
end
