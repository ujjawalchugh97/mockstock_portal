class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_stock_mappings
  has_many :stocks, :through => :user_stock_mappings
  has_many :user_short_mappings
  before_save :check_user_balance



  def m1_stock_holdings
  	stocks = UserStockMapping.includes(:stock, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [1,2,3,4])
    stocks.order(:stock_id)
  end

  def m1_short_holdings
    shorts = UserShortMapping.includes(:short, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [1,2,3,4])
    shorts.order(:stock_id)
  end

  def m1_sfuture_holdings
    shorts = UserSfutureMapping.includes(:sfuture, :user).where("user_id in (?)", [self.id])
    final_shorts = shorts.includes(:sfuture).where("sfutures.stock_id in (?)", [1,2,3,4]).references(:sfuture)
    #final_shorts.order(:stock_id)
  end

  def m1_bfuture_holdings
    shorts = UserBfutureMapping.includes(:bfuture, :user).where("user_id in (?)", [self.id])
    final_shorts = shorts.includes(:bfuture).where("bfutures.stock_id in (?)", [1,2,3,4]).references(:sfuture)
    #final_shorts.order(:stock_id)
  end

  def m2_stock_holdings
    stocks = UserStockMapping.includes(:stock, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [5,6,7,8])
    stocks.order(:stock_id)
  end

  def m2_short_holdings
    shorts = UserShortMapping.includes(:short, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [5,6,7,8])
    shorts.order(:stock_id)
  end

  def m2_sfuture_holdings
    shorts = UserSfutureMapping.includes(:sfuture, :user).where("user_id in (?)", [self.id])
    final_shorts = shorts.includes(:sfuture).where("sfutures.stock_id in (?)", [5,6,7,8]).references(:sfuture)
    #final_shorts.order(:stock_id)
  end

  def m2_bfuture_holdings
    shorts = UserBfutureMapping.includes(:bfuture, :user).where("user_id in (?)", [self.id])
    final_shorts = shorts.includes(:bfuture).where("bfutures.stock_id in (?)", [5,6,7,8]).references(:sfuture)
    #final_shorts.order(:stock_id)
  end

    def m3_stock_holdings
      stocks = UserStockMapping.includes(:stock, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [9,10,11,12])
      stocks.order(:stock_id)
    end

    def m3_short_holdings
      shorts = UserShortMapping.includes(:short, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [9,10,11,12])
      shorts.order(:stock_id)
    end

    def m3_sfuture_holdings
      shorts = UserSfutureMapping.includes(:sfuture, :user).where("user_id in (?)", [self.id])
      final_shorts = shorts.includes(:sfuture).where("sfutures.stock_id in (?)", [9,10,11,12]).references(:sfuture)
      #final_shorts.order(:stock_id)
    end

    def m3_bfuture_holdings
      shorts = UserBfutureMapping.includes(:bfuture, :user).where("user_id in (?)", [self.id])
      final_shorts = shorts.includes(:bfuture).where("bfutures.stock_id in (?)", [9,10,11,12]).references(:sfuture)
      #final_shorts.order(:stock_id)
    end

    def m4_stock_holdings
        stocks = UserStockMapping.includes(:stock, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [13,14,15,16])
        stocks.order(:stock_id)
    end

      def m4_short_holdings
        shorts = UserShortMapping.includes(:short, :user).where("user_id in (?) AND stock_id in (?)", [self.id], [13,14,15,16])
        shorts.order(:stock_id)
      end

      def m4_sfuture_holdings
        shorts = UserSfutureMapping.includes(:sfuture, :user).where("user_id in (?)", [self.id])
        final_shorts = shorts.includes(:sfuture).where("sfutures.stock_id in (?)", [13,14,15,16]).references(:sfuture)
        #final_shorts.order(:stock_id)
      end

      def m4_bfuture_holdings
        shorts = UserBfutureMapping.includes(:bfuture, :user).where("user_id in (?)", [self.id])
        final_shorts = shorts.includes(:bfuture).where("bfutures.stock_id in (?)", [13,14,15,16]).references(:sfuture)
        #final_shorts.order(:stock_id)
      end



private
  def check_user_balance
    if self.balance1 < 0 ||  self.balance2 < 0 || self.balance3 < 0 || self.balance4 < 0 || self.balance_nc1 < 0 || self.balance_nc2 < 0 || self.balance_nc3 < 0 || self.balance_nc4 < 0
      raise Error.new "Cannot Have negative balance"
    end
  end

end
