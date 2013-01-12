class CreateOcats < ActiveRecord::Migration
  def change
    create_table :ocats do |t|
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
