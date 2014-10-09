require "./lib/costumer"

class Staff 

	attr_reader :section, :duties
	attr_accessor :in_duty

	def initialize(section=nil)
		@section = section
		@duties  = set_duty
		@in_duty = nil
	end

	def set_duty
		if @section === 'waiter'
			@duties = ['menu','order','serve' ] 
		else
      @duties = ['cook','order','serve' ]
    end 
  end

  def give_menu costumer
  	costumer.status = @duties[0]
  	@in_duty        = @duties[0]
  end

  def sent_order chef
    chef.in_duty = @duties[1]
	end

	def start_cooking
    self.in_duty = @duties[0]
	end

	def cooking
		self.in_duty = @duties[2]
		1800.times do |secs| puts secs end 
	end

	def serving_food costumer
		self.in_duty    = @duties[2]
		costumer.status = @duties[2]
	end

end