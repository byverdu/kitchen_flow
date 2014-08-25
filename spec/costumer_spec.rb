require "timecop"
require "costumer"



describe Costumer do

	context "arriving to the restaurant" do

		let(:client)  { Costumer.new }

		it "is initialized without being hungry" do
			expect(client.hungry).to be nil
		end

		it "knows when is lunch time" do
			midday = Time.local(2014,8,25,12,0)
			Timecop.freeze(midday)

			client.time_to_eat! midday

			expect(client.hungry).to be true
		end

		it "knows when is dinner time" do
			dinner = Time.local(2014,8,25,18,0)
			Timecop.freeze(dinner)

			client.time_to_eat! dinner

			expect(client.hungry).to be true
		end

		it "knows how to go to the restaurant" do
			place = double :restaurant
			expect(place).to receive(:dining_room).and_return(client)

			client.going_to_eat place

			expect(client.sit).to be true
		end

	end
end

