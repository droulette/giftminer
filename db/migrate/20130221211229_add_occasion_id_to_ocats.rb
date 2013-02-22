class AddOccasionIdToOcats < ActiveRecord::Migration
  def change
    add_column :ocats, :occasion_id, :integer
  end
end
