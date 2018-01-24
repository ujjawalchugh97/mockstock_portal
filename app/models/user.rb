class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_stock_mappings
  has_many :stocks, :through => :user_stock_mappings

  def stock_holdings
  	stocks = UserStockMapping.includes(:stocks, :users).where("user_id in (?)", self.id)
    stocks.order(:created_at)
  end
end
