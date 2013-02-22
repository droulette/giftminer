class RenameOcatCategoryToNameToOcat < ActiveRecord::Migration
  def up
    rename_column :ocats, :category, :name
  end

  def down
    rename_column :ocats, :name, :category
  end
end
