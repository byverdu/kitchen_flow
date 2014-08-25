require "timecop"

class Costumer

	attr_accessor :hungry

	def intialize
		@hungry = false
	end 



end

describe Costumer do

	context "arriving to the restaurant" do

		let(:jhon)  { Costumer.new }

		it "is initialized without being hungry" do
			expect(jhon.hungry).to be false
		end

	end
end

