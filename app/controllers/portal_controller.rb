class PortalController < ApplicationController
	before_action :authenticate_user!
  
  def index
  	@m1_stocks = Stock.m_stocks(1)
  	@m2_stocks = Stock.m_stocks(2)
  	@m3_stocks = Stock.m_stocks(3)
  	@m4_stocks = Stock.m_stocks(4)
  end
  
  def buy_stock
  	stock_id = params[:stock_id]
  	num = params[:num].to_i
  	if num < 0
  		raise Error.new "Cannot Have negative no of shares"
  	end
  	stock = Stock.where(:id => stock_id).first
  	investment = stock.price*num
  	
  	if stock.market_id == 1
    	current_user.balance1 = current_user.balance1 - investment
    elsif stock.market_id == 2
    	current_user.balance2 = current_user.balance2 - investment
    elsif stock.market_id == 3
    	current_user.balance3 = current_user.balance3 - investment
    elsif stock.market_id == 4
    	current_user.balance4 = current_user.balance4 - investment
    end

    stock.price = stock.price + 10 #TODO
    stock.qty_in_market = stock.qty_in_market + num
    current_user.save
    stock.save
    
    stock_mapping = UserStockMapping.where(:user_id => current_user.id, :stock_id => stock_id).first
    unless stock_mapping  
      UserStockMapping.create(:user_id => current_user.id, stock_id: stock_id, no_of_shares: params[:num], investment: investment)
    else
      stock_mapping.no_of_shares = stock_mapping.no_of_shares + num
      stock_mapping.investment = stock_mapping.investment + investment
      stock_mapping.save
    end

  	return redirect_to '/portal/index'
  end

  def sell_stock
  	stock_id = params[:stock_id]
  	num = params[:num].to_i
  	stock = Stock.where(:id => stock_id).first
  	amt = stock.price*num

  	if num < 0
  		raise Error.new "Cannot Have negative no of shares"
  	end
  	
  	stock_mapping = UserStockMapping.where(:user_id => current_user.id, :stock_id => stock_id).first
    unless stock_mapping  
    	raise Error.new "You don't own the stock"
    else
      stock_mapping.no_of_shares = stock_mapping.no_of_shares - num
      stock_mapping.investment = stock_mapping.investment - amt
      stock_mapping.save
    end
  	
  	if stock.market_id == 1
    	current_user.balance1 = current_user.balance1 + amt
    elsif stock.market_id == 2
    	current_user.balance2 = current_user.balance2 + amt
    elsif stock.market_id == 3
    	current_user.balance3 = current_user.balance3 + amt
    elsif stock.market_id == 4
    	current_user.balance4 = current_user.balance4 + amt
    end

    stock.price = stock.price - 10 #TODO
    stock.qty_in_market = stock.qty_in_market - num
    current_user.save
    stock.save
    
  	return redirect_to '/portal/index'
  end
end
