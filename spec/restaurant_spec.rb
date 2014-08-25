require "restaurant"


describe Restaurant do

	def fill_restaurant place
		place.capacity.times{restaurant.set_dining_room Costumer.new}
	end

	let(:restaurant)   { Restaurant.new }
	let(:client)       { double :costumer }

	it "is initialized with a capacity" do
		expect(restaurant.capacity).to eq 40
	end

	it "is initialized as a container" do
		expect(restaurant.tables).to eq []
	end

	it "knows how many costumers have" do
		restaurant.set_dining_room(client)
		
		expect(restaurant.tables.count).to eq 1		
	end

	it "knows when is full" do
		fill_restaurant restaurant

		restaurant.is_full?

		expect(restaurant.tables.count).to eq(restaurant.capacity)
	end

	it "the dining room is organized by table number and costumer" do
		expect(restaurant.set_dining_room(client)).to eq([:table_number => client])
	end

	xit "every table gets the number of his array position" do

	end

end
