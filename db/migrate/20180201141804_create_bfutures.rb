class CreateBfutures < ActiveRecord::Migration[5.1]
  def change
    create_table :bfutures do |t|
      t.references :stock, foreign_key: true
      t.string :time
      t.decimal :buying_price
      t.decimal :price_per_share

      t.timestamps
    end
  end
end
