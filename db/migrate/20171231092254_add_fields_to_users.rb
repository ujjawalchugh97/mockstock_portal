class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nameteam, :string, null: false, default: ""
    add_column :users, :namep1, :string, null: false, default: ""
    add_column :users, :namep2, :string
    add_column :users, :contactp1, :string, null: false, default: ""
    add_column :users, :contactp2, :string
    add_column :users, :balance, :decimal, default: 500000
    add_column :users, :s1, :integer, default: 0
    add_column :users, :s2, :integer, default: 0
    add_column :users, :s3, :integer, default: 0
    add_column :users, :s4, :integer, default: 0
    add_column :users, :s5, :integer, default: 0
    add_column :users, :s6, :integer, default: 0
    add_column :users, :s7, :integer, default: 0
    add_column :users, :s8, :integer, default: 0
    
  end
end
