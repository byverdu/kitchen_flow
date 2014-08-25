class Restaurant

	attr_accessor :capacity, :tables

	CAPACITY = 40

	def initialize
		@capacity   = CAPACITY
		@tables   ||= []
	end

	def dining_room client
		{:table_number => client}
	end



	

	
end