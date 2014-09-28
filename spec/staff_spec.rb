require "staff"

describe Staff do

let(:staff)  { Staff.new() }
let(:waiter) { Staff.new('waiter') }
let(:chef)   { Staff.new('chef') }

let(:restaurant) { double :restaurant }
let(:costumer)   { double :costumer   }

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

		it "has a duty depending the section" do
			expect(waiter.duty).to eq(['menu','serve'])
			expect(chef.duty).to   eq(['cook','serve'])
		end
	end

	context "waiter dealing with the costumer" do

		xit "goes to the table if a costumer seats" do
			expect(restaurant).to receive(:set_dining_room).and_return(costumer)
		end
	end

end