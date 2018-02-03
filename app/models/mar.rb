class Mar < ApplicationRecord
	has_many :stocks
	def self.m (a)
  		e = Mar.where("id in (?)", [a]) 	
  	end
end
