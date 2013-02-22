class DropOcatsOccasionTable < ActiveRecord::Migration
  def up
    drop_table :ocats_occasions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
