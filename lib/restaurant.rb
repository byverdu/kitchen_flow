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
end
