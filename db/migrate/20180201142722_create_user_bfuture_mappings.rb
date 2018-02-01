class CreateUserBfutureMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bfuture_mappings do |t|
      t.references :user, foreign_key: true
      t.references :bfuture, foreign_key: true
      t.integer :no_of_shares

      t.timestamps
    end
  end
end
