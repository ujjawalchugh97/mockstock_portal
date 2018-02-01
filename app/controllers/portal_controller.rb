class PortalController < ApplicationController
	before_action :authenticate_user!
  
  def index
  	@r51 = ExRate.er(5,1).first.rate
    

    @user_m1_stocks = current_user.m1_stock_holdings

    @m1_stocks = Stock.m_stocks(1)
  	@m2_stocks = Stock.m_stocks(2)
  	@m3_stocks = Stock.m_stocks(3)
  	@m4_stocks = Stock.m_stocks(4)
  	@sfutures = Sfuture.all

    @r15 = ExRate.er(1,5).first.rate 
    
    @r12 = ExRate.er(1,2).first.rate
    @r13 = ExRate.er(1,3).first.rate
    @r14 = ExRate.er(1,4).first.rate

    @currencies = Currency.all
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
      UserStockMapping.create(:user_id => current_user.id, stock_id: stock_id, no_of_shares: num, investment: investment)
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
      if stock_mapping.no_of_shares == 0
      	stock_mapping.destroy
      end
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


  def short_stock
  	stock_id = params[:stock_id]
  	num = params[:num].to_i
  	stock = Stock.where(:id => stock_id).first
  	amt = stock.price*num

  	if num < 0
  		raise Error.new "Cannot Have negative no of shares"
  	end
  	
  	short_mapping = UserShortMapping.where(:user_id => current_user.id, :stock_id => stock_id).first
    unless short_mapping  
    	UserShortMapping.create(:user_id => current_user.id, stock_id: stock_id, no_of_shares: num, amt: amt)
    else
      short_mapping.no_of_shares = stock_mapping.no_of_shares + num
      short_mapping.amt = stock_mapping.amt + amt
      short_mapping.save
    end
  	
  	#if stock.market_id == 1
    #	current_user.balance1 = current_user.balance1 + amt
    #elsif stock.market_id == 2
    #	current_user.balance2 = current_user.balance2 + amt
    #elsif stock.market_id == 3
    #	current_user.balance3 = current_user.balance3 + amt
    #elsif stock.market_id == 4
    #	current_user.balance4 = current_user.balance4 + amt
    #end

    #stock.price = stock.price - 10 #TODO
    #stock.qty_in_market = stock.qty_in_market - num
    #current_user.save
    #stock.save
    
  	return redirect_to '/portal/index'
  end

  def buy_sfuture
  	future_id = params[:future_id]
  	num = params[:num].to_i
  	future = Sfuture.where(:id => future_id).first

  	if num < 0
  		raise Error.new "Cannot Have negative no of shares"
  	end
  	
  	future_mapping = UserSfutureMapping.where(:user_id => current_user.id, :sfuture_id => future_id).first
    unless future_mapping  
    	UserSfutureMapping.create(:user_id => current_user.id, sfuture_id: future_id, no_of_shares: num)
    else
      future_mapping.no_of_shares = future_mapping.no_of_shares + num
      future_mapping.save
    end
  	
  	#if stock.market_id == 1
    #	current_user.balance1 = current_user.balance1 + amt
    #elsif stock.market_id == 2
    #	current_user.balance2 = current_user.balance2 + amt
    #elsif stock.market_id == 3
    #	current_user.balance3 = current_user.balance3 + amt
    #elsif stock.market_id == 4
    #	current_user.balance4 = current_user.balance4 + amt
    #end

    #stock.price = stock.price - 10 #TODO
    #stock.qty_in_market = stock.qty_in_market - num
    #current_user.save
    #stock.save
    
  	return redirect_to '/portal/index'
  end

  def ex_cur
    id_f = params[:exf][:id]
    id_t = params[:ext][:id]
    amt = params[:amt].to_f
    r = ExRate.er(id_f, id_t).first.rate
    
    if id_f == '1'
      current_user.balance1 = current_user.balance1 - amt
    elsif id_f == '2'
      current_user.balance2 = current_user.balance2 - amt
    elsif id_f == '3'
      current_user.balance3 = current_user.balance3 - amt
    elsif id_f == '4'
      current_user.balance4 = current_user.balance4 - amt
    end

    if id_t == '1'
      current_user.balance1 = current_user.balance1 + amt*r
    elsif id_t == '2'
      current_user.balance2 = current_user.balance2 + amt*r
    elsif id_t == '3'
      current_user.balance3 = current_user.balance3 + amt*r
    elsif id_t == '4'
      current_user.balance4 = current_user.balance4 + amt*r
    end

    current_user.save
    return redirect_to '/portal/index'
  end

end
