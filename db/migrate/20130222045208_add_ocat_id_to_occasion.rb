class AddOcatIdToOccasion < ActiveRecord::Migration
  def change
    add_column :occasions, :ocat_id, :integer
    remove_column :ocats, :occasion_id
  end
end
