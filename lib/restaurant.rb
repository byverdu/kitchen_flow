class Restaurant

	attr_accessor  :tables, :tables_full
	attr_reader    :capacity

	CAPACITY = 40

	def initialize
		@capacity    = CAPACITY
		@tables      = Array.new(CAPACITY/2,'Empty')
		@tables_full = []
	end

	def is_full?
		@tables_full.size === (CAPACITY/2)
	end

	def set_dining_room costumer

		raise 'The Restaurant is full' if is_full?
		
		table_number = @tables.size

		@tables[table_number] = { table_number => costumer }

		@tables_full << @tables.pop
		@tables.pop
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
