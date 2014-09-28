require "restaurant"


describe Restaurant do

	def fill_restaurant 
		20.times{restaurant.set_dining_room Costumer.new(name: 'albert')}
	end

	let(:restaurant)   { Restaurant.new }
	let(:costumer)       { double :costumer }

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

	context 'dealing with costumers' do

		it "can accept costumers" do
			allow(costumer).to receive(:name)
			restaurant.set_dining_room(costumer)
			expect(restaurant.tables[1][0]).to be nil 
		end
		
		it "is moved inside the restaurant" do
			allow(costumer).to receive(:name)
			restaurant.set_dining_room(costumer)

			expect(restaurant.tables.length).to eq(19)
			expect(restaurant.tables_full.length).to eq(1)
		end
		
	end

	# it "knows when is full" do
	# 	fill_restaurant 

	# 	expect(restaurant.is_full?).to be true
	# end

	xit "raise an error if the restaurant is full" do
		fill_restaurant 

		restaurant.is_full?

		expect { restaurant.set_dining_room(costumer) }.to raise_error(RuntimeError)
	end

	xit "stores the costumers by name in a hash" do
		allow(costumer).to receive(:name)

		expect(restaurant.set_dining_room(costumer)).to eq([{costumer.name => costumer}])
	end

	xit "the dining room is organized by table number and costumer" do
		table_number = [] 
 		
		restaurant.capacity.times{table_number<<'table_number_'}

		table_number.each_with_index do |table,index|
 			
		expect(restaurant.set_dining_room(costumer)).to eq([table+(index+1).to_s => costumer])

 		end
	end
end
