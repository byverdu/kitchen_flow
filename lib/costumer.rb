class Costumer

	attr_reader   :hungry, :sit
	attr_accessor :name, :menu

	def initialize(name=nil)
		@hungry = nil
		@sit    = false
		@name   = name
		@menu   = nil
	end 

	def time_to_eat! hour
		@hungry = true if Time.now.hour === 12 || Time.now.hour === 18
	end

	def going_to_eat place
		place.set_dining_room self	
		@sit    = true
		@hungry = true
	end

end	