class AddMarToStocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :mar, foreign_key: true
  end
end
