class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :qty_in_market
      t.decimal :price
      t.references :market, foreign_key: true

      t.timestamps
    end
  end
end
