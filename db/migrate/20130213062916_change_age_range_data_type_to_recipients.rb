class ChangeAgeRangeDataTypeToRecipients < ActiveRecord::Migration
  def up
    change_column :recipients, :age_range, :integer
    rename_column :recipients, :age_range, :age
  end

  def down
    change_column :recipients, :age_range, :string
    rename_column :recipients, :age, :age_range
  end
end
