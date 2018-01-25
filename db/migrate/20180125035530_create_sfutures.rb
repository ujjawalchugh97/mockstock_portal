class CreateSfutures < ActiveRecord::Migration[5.1]
  def change
    create_table :sfutures do |t|
      t.references :stock, foreign_key: true
      t.string :time
      t.decimal :selling_price
      t.decimal :price_per_share

      t.timestamps
    end
  end
end
