class CreateStockHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_histories do |t|
      t.references :stock, foreign_key: true
      t.integer :buy
      t.decimal :no_of_shares

      t.timestamps
    end
  end
end
