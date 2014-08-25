class Costumer

	attr_accessor :hungry, :sit

	def intialize
		@hungry = nil
		@sit    = false 
	end 

	def time_to_eat! hour
		@hungry = true if Time.now.hour === 12 || Time.now.hour === 18
	end

	def going_to_eat place
		place.dining_room self	
		@sit = true
	end

end	