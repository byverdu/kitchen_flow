require "restaurant"


describe Restaurant do

	let(:restaurant)   { Restaurant.new }
	let(:client)       { double :costumer }

	it "is initialized with a capacity" do
		expect(restaurant.capacity).to eq 40
	end

	it "is initialized as a container" do
		expect(restaurant.tables).to eq []
	end

	it "the dining room is organized by table number and costumer" do

		expect(restaurant.dining_room(client)).to eq(:table_number => client)
	end

end
