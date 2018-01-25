class ShortsController < ApplicationController
	before_action :authenticate_admin!
  
  def index
  	 @shorts = UserShortMapping.all
  end

  def execute
  	short_id = params[:short_id]
  	short = UserShortMapping.where(:id => short_id).first
  	u = short.user
  	s = short.stock

  	if s.market_id == 1
    	u.balance1 = u.balance1 + short.amt - s.price*short.no_of_shares
    elsif s.market_id == 2
    	u.balance2 = u.balance2 + short.amt - s.price*short.no_of_shares
    elsif s.market_id == 3
    	u.balance3 = u.balance3 + short.amt - s.price*short.no_of_shares
    elsif s.market_id == 4
    	u.balance4 = u.balance4 + short.amt - s.price*short.no_of_shares
    end 

    u.save
    short.destroy
    return redirect_to '/shorts/index'

  end


end
