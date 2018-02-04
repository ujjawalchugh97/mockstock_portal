class Stock < ApplicationRecord
  belongs_to :market
  belongs_to :mar
  has_many :user_stock_mappings
  has_many :users, :through => :user_stock_mappings
  has_many :user_short_mappings
  has_many :sfutures
  has_many :bfutures

  def self.m_stocks(n)
  	m_stocks = Stock.where("market_id in (?)", n)
  	m_stocks.order(:name)
  end

end
