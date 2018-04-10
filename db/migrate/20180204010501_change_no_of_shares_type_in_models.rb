class ChangeNoOfSharesTypeInModels < ActiveRecord::Migration[5.1]
  def change
    change_column :user_short_mappings, :no_of_shares, :decimal
    change_column :user_stock_mappings, :no_of_shares, :decimal

  end
end
