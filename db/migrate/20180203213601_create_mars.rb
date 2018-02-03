class CreateMars < ActiveRecord::Migration[5.1]
  def change
    create_table :mars do |t|
      t.string :name
      t.string :currency
      t.decimal :rate

      t.timestamps
    end
  end
end
