require "restaurant"


describe Restaurant do

	def fill_restaurant 
		20.times{restaurant.set_dining_room Costumer.new(name: 'albert')}
	end

	let(:restaurant)   { Restaurant.new }
	let(:client)       { double :costumer }

	context 'is initialized' do
	
		it "with a capacity" do
			expect(restaurant.capacity).to eq 40
		end

		it "with 20 tables" do
			expect(restaurant.tables.count).to eq(20)
		end

		it "knows when a table is full" do
			expect(restaurant.tables_full).to eq([])
		end
	end

	# it "can accept costumers" do
	# 	allow(client).to receive(:name)
	# 	restaurant.set_dining_room(client)
	# 	restaurant.tables[1] = client
	# 	expect(restaurant.tables[1]).not_to be nil		
	# end

	# it "knows when is full" do
	# 	fill_restaurant 

	# 	expect(restaurant.is_full?).to be true
	# end

	xit "raise an error if the restaurant is full" do
		fill_restaurant 

		restaurant.is_full?

		expect { restaurant.set_dining_room(client) }.to raise_error(RuntimeError)
	end

	xit "stores the costumers by name in a hash" do
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
