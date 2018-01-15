class RemoveStockfieldsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :s1, :integer
    remove_column :users, :s2, :integer
    remove_column :users, :s3, :integer
    remove_column :users, :s4, :integer
    remove_column :users, :s5, :integer
    remove_column :users, :s6, :integer
    remove_column :users, :s7, :integer
    remove_column :users, :s8, :integer
  end
end
