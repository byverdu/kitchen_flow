require "./lib/costumer"

class Staff 

	attr_reader :section, :duty

	def initialize(section=nil)
		@section = section
		@duty = set_duty
	end

	def set_duty
		if @section === 'waiter'
			@duty = ['menu','serve'] 
		else
      @duty = ['cook','serve']
    end 
  end

  def give_menu costumer
  	costumer.menu = @duty[0]
  end

end