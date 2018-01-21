class RemoveStocksFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :stocks, :string
  end
end
