class CreateUserStockMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stock_mappings do |t|
      t.references :user, foreign_key: true
      t.references :stock, foreign_key: true
      t.integer :no_of_shares
      t.decimal :price_bought_at

      t.timestamps
    end
  end
end
