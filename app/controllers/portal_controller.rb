class PortalController < ApplicationController
	before_action :authenticate_user!

  def index



    @user_m1_stocks = current_user.m1_stock_holdings
    @user_m1_shorts = current_user.m1_short_holdings
    @user_m1_sfutures = current_user.m1_sfuture_holdings
    @user_m1_bfutures = current_user.m1_bfuture_holdings
		@user_m2_stocks = current_user.m2_stock_holdings
    @user_m2_shorts = current_user.m2_short_holdings
    @user_m2_sfutures = current_user.m2_sfuture_holdings
    @user_m2_bfutures = current_user.m2_bfuture_holdings
		@user_m3_stocks = current_user.m3_stock_holdings
		@user_m3_shorts = current_user.m3_short_holdings
		@user_m3_sfutures = current_user.m3_sfuture_holdings
		@user_m3_bfutures = current_user.m3_bfuture_holdings
		@user_m4_stocks = current_user.m4_stock_holdings
		@user_m4_shorts = current_user.m4_short_holdings
		@user_m4_sfutures = current_user.m4_sfuture_holdings
		@user_m4_bfutures = current_user.m4_bfuture_holdings

    @m1_stocks = Stock.m_stocks(1)
  	@m2_stocks = Stock.m_stocks(2)
  	@m3_stocks = Stock.m_stocks(3)
  	@m4_stocks = Stock.m_stocks(4)

  	@sfutures = Sfuture.all
		@bfutures = Bfuture.all

		@r51 = ExRate.er(5,1).first.rate
		@r52 = ExRate.er(5,2).first.rate
		@r53 = ExRate.er(5,3).first.rate
		@r54 = ExRate.er(5,4).first.rate

		m1 = Mar.m(1).first
		m2 = Mar.m(2).first
		m3 = Mar.m(3).first
		m4 = Mar.m(4).first
		@r11 = 1
		@r12 = m1.rate/m2.rate
		@r13 = m1.rate/m3.rate
		@r14 = m1.rate/m4.rate
		@r21 = m2.rate/m1.rate
		@r22 = m2.rate/m2.rate
		@r23 = m2.rate/m3.rate
		@r24 = m2.rate/m4.rate
		@r31 = m3.rate/m1.rate
		@r32 = m3.rate/m2.rate
		@r33 = m3.rate/m3.rate
		@r34 = m3.rate/m4.rate
		@r41 = m4.rate/m1.rate
		@r42 = m4.rate/m2.rate
		@r43 = m4.rate/m3.rate
		@r44 = m4.rate/m4.rate

		#@r15 = ExRate.er(1,5).first.rate

    # @r12 = ExRate.er(1,2).first.rate
    # @r13 = ExRate.er(1,3).first.rate
    # @r14 = ExRate.er(1,4).first.rate

    @currencies = Mar.all
  end

  def buy_stock
  	stock_id = params[:buyFormIdBuy]
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

    stock.price = stock.price + 0.04*stock.num/(stock.qty_in_market+2) #TODO
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
  	stock_id = params[:buyFormIdSell]
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
			if stock_mapping.no_of_shares == 0
      	stock_mapping.destroy
      end

  	if stock.mar_id == 1
    	current_user.balance1 = current_user.balance1 + amt
    elsif stock.mar_id == 2
    	current_user.balance2 = current_user.balance2 + amt
    elsif stock.mar_id == 3
    	current_user.balance3 = current_user.balance3 + amt
    elsif stock.mar_id == 4
    	current_user.balance4 = current_user.balance4 + amt
    end

    stock.price = stock.price - 0.04*stock.num/(stock.qty_in_market+2)
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
	end

		def buy_bfuture
	  	future_id = params[:future_id]
	  	num = params[:num].to_i
	  	future = Bfuture.where(:id => future_id).first

	  	if num < 0
	  		raise Error.new "Cannot Have negative no of shares"
	  	end

	  	future_mapping = UserBfutureMapping.where(:user_id => current_user.id, :bfuture_id => future_id).first
	    unless future_mapping
	    	UserBfutureMapping.create(:user_id => current_user.id, bfuture_id: future_id, no_of_shares: num)
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
    #raise params.inspect
    id_f = params[:exf][:id]
    id_t = params[:ext][:id]

    amt = params[:amt].to_f
    m1 = Mar.m(id_f).first
    m2 = Mar.m(id_t).first
    r1 = m1.rate
    r2 = m2.rate

    r = r1/r2

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

    if(m1.id != 4)
      m1.rate = (r1+0.0000025*amt)/(1-0.00004*amt)
    end

    if(m2.id != 4)
      m2.rate = (r2+0.000001*amt)/(1-0.0000001*amt)
    end

    m1.save
    m2.save
    current_user.save
    return redirect_to '/portal/index'
  end

	def buy_coin
		id_f = params[:exf][:id]
    amt = params[:amt].to_f
		r = ExRate.er(5,id_f).first.rate


		if id_f == '1'
      current_user.balance1 = current_user.balance1 - amt
    elsif id_f == '2'
      current_user.balance2 = current_user.balance2 - amt
    elsif id_f == '3'
      current_user.balance3 = current_user.balance3 - amt
    elsif id_f == '4'
      current_user.balance4 = current_user.balance4 - amt
    end

		current_user.balance_nc1 += amt/(r)
		current_user.save
		return redirect_to '/portal/index'


	end

	def sell_coin
		id_f = params[:exf][:id]
    amt = params[:amt].to_f
		r = ExRate.er(5,id_f).first.rate


		if id_f == '1'
      current_user.balance1 = current_user.balance1 + amt
    elsif id_f == '2'
      current_user.balance2 = current_user.balance2 + amt
    elsif id_f == '3'
      current_user.balance3 = current_user.balance3 + amt
    elsif id_f == '4'
      current_user.balance4 = current_user.balance4 + amt
    end

		current_user.balance_nc1 -= amt/(r)
		return redirect_to '/portal/index'
	end

end
