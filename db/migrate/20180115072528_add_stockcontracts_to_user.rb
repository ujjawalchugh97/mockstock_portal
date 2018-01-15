class AddStockcontractsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stocks, :string, null: false, default: ""
    add_column :users, :contracts, :string, null: false, default: ""
  end
end
