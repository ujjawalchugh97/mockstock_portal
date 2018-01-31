class CreateExRates < ActiveRecord::Migration[5.1]
  def change
    create_table :ex_rates do |t|
      t.integer :m1
      t.integer :m2
      t.string :m1c
      t.string :m2c
      t.decimal :rate

      t.timestamps
    end
  end
end
