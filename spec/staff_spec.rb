require "staff"

describe Staff do

let(:staff)  { Staff.new()}
let(:waiter) { Staff.new('waiter') }
let(:chef)   { Staff.new('chef') }

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
	end

end