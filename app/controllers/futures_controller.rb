class FuturesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	 @sfutures = UserSfutureMapping.all
     @bfutures = UserBfutureMapping.all

  end

  def execute_s
  	sfuture_id = params[:sfuture_id]
  	m = UserSfutureMapping.where(:id => sfuture_id).first
  	u = m.user
  	f = m.sfuture

  	if f.stock.market_id == 1
    	u.balance1 = u.balance1 + (f.selling_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 2
    	u.balance2 = u.balance2 + (f.selling_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 3
    	u.balance3 = u.balance3 + (f.selling_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 4
    	u.balance4 = u.balance4 + (f.selling_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    end

    u.save
    m.destroy
    return redirect_to '/futures/index'

  end

  def execute_b
  	bfuture_id = params[:bfuture_id]
  	m = UserBfutureMapping.where(:id => bfuture_id).first
  	u = m.user
  	f = m.sfuture

  	if f.stock.market_id == 1
    	u.balance1 = u.balance1 - (f.buying_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 2
    	u.balance2 = u.balance2 - (f.buying_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 3
    	u.balance3 = u.balance3 - (f.buying_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    elsif f.stock.market_id == 4
    	u.balance4 = u.balance4 - (f.buying_price - f.stock.price)*m.no_of_shares - (f.price_per_share*m.no_of_shares)
    end

    u.save
    m.destroy
    return redirect_to '/futures/index'

  end



end
