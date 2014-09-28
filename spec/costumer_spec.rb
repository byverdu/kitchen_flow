require "timecop"
require "costumer"



describe Costumer do
	
	let(:costumer)   { Costumer.new }
	let(:restaurant) { double :restaurant }
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

			costumer.time_to_eat! midday

			expect(costumer.hungry).to be true
		end

		it "knows when is dinner time" do
			dinner = Time.local(2014,8,25,18,0)
			Timecop.freeze(dinner)

			costumer.time_to_eat! dinner

			expect(costumer.hungry).to be true
		end

		it "knows how to go to the restaurant" do
			expect(restaurant).to receive(:set_dining_room).and_return(costumer)

			costumer.going_to_eat restaurant

			expect(costumer.sit).to be true
			expect(costumer.hungry).to be true
		end

		it "has the no menu from home" do
			expect(costumer.menu).to be nil
		end

	end

	context 'inside the restaurant' do
		
		it "has the menu" do
			waiter.give_menu costumer

			expect(costumer.menu).to eq("menu")
		end
	end
end

