require "./lib/staff"

class Costumer

	attr_reader   :hungry, :sit
	attr_accessor :name, :status, :mood

	def initialize(name=nil)
		@hungry = nil
		@sit    = false
		@name   = name
		@status = nil
		@mood   = set_mood
	end 

	def time_to_eat? hour
		@hungry = true if Time.now.hour === 12 || Time.now.hour === 18
		raise 'Stay hungry, Stay foolish' unless @hungry

		return 'yes, lets go to eat'
	end

	def going_to_eat restaurant
		restaurant.set_dining_room self	
		@sit    = true
		@hungry = true
	end

	def ready_to_order waiter
		@status        = waiter.duties[1]
		waiter.in_duty = waiter.duties[1]
	end

	def enjoying_meal
		@status = 'eating'
		1800.times do |secs| secs end 
	end

	def set_mood
		['horrible','acceptable','marvelous'].sample
	end

	def time_to_pay

		case @mood
		when 'horrible'
			 "run run run"

		when 'acceptable'
			 "give me back every penny"

		when 'marvelous'
			'oh man, best deal ever'
		end
	end

end	











