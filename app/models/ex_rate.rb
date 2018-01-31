class ExRate < ApplicationRecord
	
	def self.er(a, b)
  		e = ExRate.where("m1 in (?) AND m2 in (?)", a, b) 	
  	end
end
