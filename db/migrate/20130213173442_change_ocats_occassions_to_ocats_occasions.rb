class ChangeOcatsOccassionsToOcatsOccasions < ActiveRecord::Migration
  def up
    rename_table :ocats_occassions, :ocats_occasions
  end

  def down
    rename_table :ocats_occasions, :ocats_occassions
  end
end
