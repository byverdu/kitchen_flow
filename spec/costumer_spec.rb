require "timecop"
require "costumer"



describe Costumer do

	context "arriving to the restaurant" do

		let(:albert)  { Costumer.new }

		it "is initialized without being hungry" do
			expect(albert.hungry).to be nil
		end

		it "knows when is lunch time" do
			midday = Time.local(2014,8,25,12,0)
			Timecop.freeze(midday)

			albert.time_to_eat! midday

			expect(albert.hungry).to be true
		end

		it "knows when is dinner time" do
			dinner = Time.local(2014,8,25,18)
			Timecop.freeze(dinner)

			albert.time_to_eat! dinner

			expect(albert.hungry).to be true
		end

		it "knows how to go to the restaurant" do
			place = double :restaurant
			expect(place).to receive(:open_door)

			albert.going_to_eat place

			expect(albert.sit).to be true
		end

	end
end

