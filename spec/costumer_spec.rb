require "timecop"
require "costumer"


describe Costumer do
	
	let(:costumer)   { Costumer.new }
	let(:restaurant) { Restaurant.new  }
	let(:waiter)     { Staff.new('waiter')}

	context "arriving to the restaurant" do


		it "is initialized without being hungry" do
			expect(costumer.hungry).to be nil
		end

		it "has his own name rather than a hash number" do
			albert = Costumer.new('albert')

			expect(albert.name).to eq('albert')
		end

		it "knows when is lunch time" do
			midday = Time.local(2014,8,25,12,0)
			Timecop.freeze(midday)

			costumer.time_to_eat? midday

			expect(costumer.hungry).to be true
			expect(costumer.time_to_eat? midday).to eq('yes, lets go to eat')
		end

		it "knows when is dinner time" do
			dinner = Time.local(2014,8,25,18,0)
			Timecop.freeze(dinner)

			costumer.time_to_eat? dinner

			expect(costumer.hungry).to be true
			expect(costumer.time_to_eat? dinner).to eq('yes, lets go to eat')
		end

		it "can not go to the restaurant if is not lunch or dinner time" do
			not_time_to_eat = Time.local(2014,8,25,21,0)
			Timecop.freeze(not_time_to_eat)

			expect{ costumer.time_to_eat? not_time_to_eat }.to raise_error(RuntimeError,'Stay hungry, Stay foolish')
	
		end

		it "knows how to go to the restaurant" do
			expect(restaurant).to receive(:set_dining_room).and_return(costumer)

			costumer.going_to_eat restaurant

			expect(costumer.sit).to be true
			expect(costumer.hungry).to be true
		end


	end

	context 'inside the restaurant' do
		
	  it "has no status" do
			expect(costumer.status).to be nil
		end
		
		it "has the menu" do
			waiter.give_menu costumer

			expect(costumer.status).to eq("menu")
		end

		it "orders when is ready" do
			costumer.ready_to_order restaurant.waiter

			expect(costumer.status).to eq(waiter.duties[1])
			expect(restaurant.waiter.in_duty).to  eq(waiter.duties[1])
		end

		it "after receiving the plates starts to eat" do
			
			expect(costumer.enjoying_meal).to eq(1800)
			expect(costumer.status).to eq('eating')
		end

		it "the satisfaction is always random" do

			expect(costumer.mood).to match(/horrible|acceptable|marvelous/)
		end

		it "leaves the place without paying if the mood is horrible" do
			
			costumer.mood = 'horrible'
			expect(costumer.time_to_pay).to eq('run run run')
		end

		it "just pays the bill if the mood is acceptable" do
			
			costumer.mood = 'acceptable'
			expect(costumer.time_to_pay).to eq('give me back every penny')
		end

		it "leaves 20 pounds note for tips if the mood is marvelous" do
			
			costumer.mood = 'marvelous'
			expect(costumer.time_to_pay).to eq('oh man, best deal ever')
		end


	end
end

