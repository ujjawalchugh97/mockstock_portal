class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_stock_mappings
  has_many :stocks, :through => :user_stock_mappings
  has_many :user_short_mappings
  before_save :check_user_balance

  

  def stock_holdings
  	stocks = UserStockMapping.includes(:stocks, :users).where("user_id in (?)", self.id)
    stocks.order(:stock_id)
  end


private
  def check_user_balance
    if self.balance1 < 0 ||  self.balance2 < 0 || self.balance3 < 0 || self.balance4 < 0 || self.balance_nc1 < 0 || self.balance_nc2 < 0 || self.balance_nc3 < 0 || self.balance_nc4 < 0
      raise Error.new "Cannot Have negative balance"
    end
  end

end