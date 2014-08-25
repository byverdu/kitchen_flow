require "timecop"

class Costumer

	attr_accessor :hungry

	def intialize
		@hungry = false
	end 

	def time_to_eat! hour
		@hungry = true if Time.now.hour === 12 || Time.now.hour === 18
	end

end

describe Costumer do

	context "arriving to the restaurant" do

		let(:jhon)  { Costumer.new }

		it "is initialized without being hungry" do
			expect(jhon.hungry).to be false
		end

		it "knows when is lunch time" do
			midday = Time.local(2014,8,25,12,0)
			Timecop.freeze(midday)

			jhon.time_to_eat! midday

			expect(jhon.hungry).to be true
		end

		it "knows when is dinner time" do
			dinner = Time.local(2014,8,25,18)
			Timecop.freeze(dinner)

			jhon.time_to_eat! dinner

			expect(jhon.hungry).to be true
		end

	end
end

