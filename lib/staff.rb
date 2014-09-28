require "./lib/costumer"

class Staff 

	attr_reader :section, :duties, :in_duty

	def initialize(section=nil)
		@section = section
		@duties  = set_duty
		@in_duty = nil
	end

	def set_duty
		if @section === 'waiter'
			@duties = ['menu','serve','order' ] 
		else
      @duties = ['cook','serve','order' ]
    end 
  end

  def give_menu costumer
  	costumer.menu = @duties[0]
  	@in_duty      = @duties[0]
  end

end