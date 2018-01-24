class RemoveBalanceFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :balance, :decimal
    remove_column :users, :contracts, :string
  end
end
