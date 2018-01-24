class RemovePriceBoughtAtFromUserStockMappings < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_stock_mappings, :price_bought_at, :decimal
  end
end
