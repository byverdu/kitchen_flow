require "restaurant"
require "costumer"

describe Restaurant do

	def fill_restaurant 
		20.times{restaurant.sitting_actual Costumer.new()}
	end

	let(:restaurant)   { Restaurant.new }
	let(:costumer)     { Costumer.new   }
	
	context 'is initialized' do
	
		it "with a capacity" do
			expect(restaurant.capacity).to eq 40
		end

		it "with 20 tables" do
			expect(restaurant.tables.size).to eq(20)
			expect(restaurant.tables[0]).to eq('Empty')
		end

		it "with a kitchen" do
			expect(restaurant.kitchen).to be_a(Array)
			expect(restaurant.kitchen).to contain_exactly(Staff)
		end

		it "knows when a table is full" do
			expect(restaurant.tables_full).to eq([])
		end

		it "has a waiter" do
			expect(restaurant).to respond_to(:waiter)
			expect(restaurant.waiter).to be_a(Staff)
		end

	end

	context 'dealing with costumers' do

		it "can accept costumers" do
			restaurant.sitting_actual(costumer)
			expect(restaurant.tables.size).to eq(19)
		end
		
		it "is moved inside the restaurant" do
			table_number = restaurant.tables.size
			waiter       = restaurant.waiter

			restaurant.sitting_actual(costumer)

			expect(restaurant.tables_full).to contain_exactly({table_number=> costumer, "waiter"=> waiter})
			expect(restaurant.tables_full.size).to eq(1) 
		end
		
		it "knows when is full" do
			fill_restaurant 

			expect(restaurant.is_full?).to be true
		end
		it "raise an error if the restaurant is full" do
			fill_restaurant 

			restaurant.is_full?

			expect { restaurant.sitting_actual(costumer) }.to raise_error(RuntimeError)
		end
	end
end
