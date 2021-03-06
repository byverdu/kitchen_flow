describe Staff do

let(:staff)   { Staff.new() }
let(:waiter)  { Staff.new('waiter') }
let(:chef)    { Staff.new('chef') }

let(:restaurant) { Restaurant.new }
let(:costumer)   { Costumer.new }

	context "when is initialized" do

		it "belongs to a section" do
			expect(staff).to respond_to(:section)
		end

		it "is a waiter" do
			expect(waiter.section).to eq('waiter')
		end

		it "is a chef" do
			expect(chef.section).to eq('chef')
		end

		it "has a set of duties depending the section" do
			expect(waiter.duties).to eq(['menu','order','serve'])
			expect(chef.duties).to   eq(['cook','order','serve'])
		end

		it "has a specific duty depending the task" do
			expect(staff.in_duty).to be nil
		end
	end

	context "waiter dealing with the costumer" do

		it "goes to the table if a costumer seats" do
			expect(restaurant).to receive(:set_dining_room).and_return(costumer)
			expect(restaurant).to receive(:waiter).and_return(waiter)
			
			restaurant.set_dining_room costumer

			expect(restaurant.waiter.give_menu(costumer)).to eq(costumer.status)
			expect(waiter.in_duty).to eq('menu')
		end

		it "receives the order from the costumer" do
			expect(restaurant).to receive(:waiter).and_return(waiter)
			costumer.ready_to_order waiter
			
			expect(restaurant.waiter.in_duty).to eq(waiter.duties[1])
		end
	end

	context "processing the costumers order" do

		it "the waiter takes it to the kitchen" do
			expect(restaurant).to receive(:waiter).and_return(waiter)
			expect(restaurant).to receive(:chef).and_return(chef)
			
			restaurant.waiter.sent_order chef
			
			expect(restaurant.chef.in_duty).to eq('order')
		end

		it "the chef starts cooking after receives the order and takes 30 minutes" do
			expect(restaurant.chef.start_cooking).to eq(1800)

			expect(restaurant.chef.in_duty).to eq('cook')
		end

		it "After the chef finishes the waiter takes the plate to the costumer" do
			restaurant.waiter.serving_food costumer

			expect(restaurant.waiter.in_duty).to eq('serve')
			expect(costumer.status).to eq('serve')
		end
	end
end



