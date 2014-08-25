class Restaurant

	attr_accessor :capacity, :tables

	CAPACITY = 40

	def initialize
		@capacity   = CAPACITY
		@tables   ||= []
	end

	def set_dining_room client
	 @tables <<	{:table_number => client}
	end

	def is_full?

	end


	

	
end