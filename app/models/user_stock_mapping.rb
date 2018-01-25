class UserStockMapping < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  before_save :check_no_of_shares

  private
  def check_no_of_shares
    if self.no_of_shares < 0
      raise Error.new "Cannot Have negative no of shares"
    end
  end

end
