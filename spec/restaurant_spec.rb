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
		allow(client).to receive(:name)
		restaurant.set_dining_room(client)
		
		expect(restaurant.tables.count).to eq 1		
	end

	it "knows when is full" do
		fill_restaurant restaurant

		expect(restaurant.is_full?).to be true
	end

	it "raise an error if the restaurant is full" do
		fill_restaurant restaurant

		restaurant.is_full?

		expect { restaurant.set_dining_room(client) }.to raise_error(RuntimeError)
	end

	it "stores the costumers by name in a hash" do
		allow(client).to receive(:name)

		expect(restaurant.set_dining_room(client)).to eq([{client.name => client}])
	end

	xit "the dining room is organized by table number and costumer" do
		table_number = [] 
 		
		restaurant.capacity.times{table_number<<'table_number_'}

		table_number.each_with_index do |table,index|
 			
		expect(restaurant.set_dining_room(client)).to eq([table+(index+1).to_s => client])

 		end
	end
end
