class Restaurant

	attr_accessor  :tables, :tables_full
	attr_reader    :capacity

	CAPACITY = 40

	def initialize
		@capacity    = CAPACITY
		@tables      = Array.new(CAPACITY/2)
		@tables_full = []
		place_tables 
	end

	def place_tables 
		start_count = 0

		while start_count < (CAPACITY/2)
			
			@tables[start_count] = {start_count => nil}
			start_count += 1
		end
	end

	def is_full?
		@tables.size === (CAPACITY/2)
	end

	def set_dining_room costumer

		@tables[0][0] = costumer 

		@tables_full << @tables.shift

	end




	# def set_dining_room client
	# 	table_number = []

	# 	@capacity.times{table_number<<'table_number_'}

	# 	raise 'Sorry, no available tables' if is_full?

	# 	# table_number.each_with_index do |table,index|

	# 	# 	@tables <<	{ table+(index+1).to_s => client}
	# 	# end

	#  	@tables <<	{ table+(index+1).to_s => client}
	# end

end
