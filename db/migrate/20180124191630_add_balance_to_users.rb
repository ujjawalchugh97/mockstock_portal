class AddBalanceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :balance1, :decimal, default: 500000
    add_column :users, :balance2, :decimal, default: 500000
    add_column :users, :balance3, :decimal, default: 500000
    add_column :users, :balance4, :decimal, default: 500000
    add_column :users, :balance_nc1, :decimal, default: 0
    add_column :users, :balance_nc2, :decimal, default: 0
    add_column :users, :balance_nc3, :decimal, default: 0
    add_column :users, :balance_nc4, :decimal, default: 0
    add_column :users, :investment_nc1, :decimal, default: 0
    add_column :users, :investment_nc2, :decimal, default: 0
    add_column :users, :investment_nc3, :decimal, default: 0
    add_column :users, :investment_nc4, :decimal, default: 0
  end
end
