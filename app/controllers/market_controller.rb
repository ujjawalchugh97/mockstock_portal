class MarketController < ApplicationController
  before_action :authenticate_admin!

  def index
    @b = Market.all


  end

  def new
    @a = Market.new(:name => params["a"])
    @a.save
    return redirect_to '/market/index'
  end
end
