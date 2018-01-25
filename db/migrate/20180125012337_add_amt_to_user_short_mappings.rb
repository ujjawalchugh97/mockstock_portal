class AddAmtToUserShortMappings < ActiveRecord::Migration[5.1]
  def change
    add_column :user_short_mappings, :amt, :decimal
  end
end
