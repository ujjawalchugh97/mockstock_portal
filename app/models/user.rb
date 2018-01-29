class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_stock_mappings
  has_many :stocks, :through => :user_stock_mappings
  has_many :user_short_mappings
  before_save :check_user_balance

  

  def m1_stock_holdings
  	stocks = UserStockMapping.includes(:stock, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [1,2,3,4])
    stocks.order(:stock_id)
  end


private
  def check_user_balance
    if self.balance1 < 0 ||  self.balance2 < 0 || self.balance3 < 0 || self.balance4 < 0 || self.balance_nc1 < 0 || self.balance_nc2 < 0 || self.balance_nc3 < 0 || self.balance_nc4 < 0
      raise Error.new "Cannot Have negative balance"
    end
  end

end