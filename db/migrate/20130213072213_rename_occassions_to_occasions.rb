class RenameOccassionsToOccasions < ActiveRecord::Migration
  def up
    rename_table :occassions, :occasions
  end

  def down
    rename_table :occasions, :occassions
  end
end
