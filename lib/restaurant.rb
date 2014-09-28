require './lib/staff'

class Restaurant

	attr_accessor  :tables, :tables_full, :waiter
	attr_reader    :capacity

	CAPACITY = 40

	def initialize
		@capacity    = CAPACITY
		@tables      = Array.new(CAPACITY/2,'Empty')
		@tables_full = []

		@waiter      = Staff.new('waiter') 
	end

	def is_full?
		@tables_full.size === (CAPACITY/2)
	end

	def set_dining_room costumer

		raise 'The Restaurant is full' if is_full?
		
		table_number = @tables.size

		@tables[table_number] = { table_number => costumer,"waiter" => @waiter}

		@tables_full << @tables.pop
		@tables.pop
	end
end
