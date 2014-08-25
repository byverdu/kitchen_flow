class Restaurant

	attr_accessor :capacity, :tables

	CAPACITY = 40

	def initialize
		@capacity   = CAPACITY
		@tables   ||= []
	end

	def is_full?
		@tables.count === CAPACITY
	end

	def set_dining_room client
		raise 'Sorry, no available tables' if is_full?

		@tables << {client.name => client}

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
