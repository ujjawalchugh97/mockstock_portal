class CreateCoinHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_histories do |t|
      t.integer :buy
      t.decimal :no_of_shares

      t.timestamps
    end
  end
end
