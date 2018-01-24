class AddInvestmentToUserStockMappings < ActiveRecord::Migration[5.1]
  def change
    add_column :user_stock_mappings, :investment, :decimal
  end
end
