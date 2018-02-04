class UpdateBalances < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance1, :decimal, default: 1000000

      change_column :users, :balance2, :decimal, default: 50000

        change_column :users, :balance3, :decimal, default: 40000

          change_column :users, :balance4, :decimal, default: 1200000
  end
end
