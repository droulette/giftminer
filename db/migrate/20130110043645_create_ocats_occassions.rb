class CreateOcatsOccassions < ActiveRecord::Migration
  def change
    create_table :ocats_occassions do |t|
      t.references :ocat
      t.references :occassion
    end
    add_index :ocats_occassions, :ocat_id
    add_index :ocats_occassions, :occassion_id
  end
end
