
RSpec.shared_examples "present_email" do
	describe "#email" do
		it 'should be present' do
			subject
			expect(subject).to_not be_valid
		end
	end
end
RSpec.shared_examples "valid_email" do
	describe "#email" do	
		it 'should be valid' do
			subject
			expect(subject).to_not be_valid
		end
	end
end
RSpec.shared_examples "unique_email" do
	describe "#email" do
		it 'should be unique' do
			subject 
			expect(subject).to_not be_valid
		end
	end
end

RSpec.shared_examples "valid_factory" do
	describe "#factory" do
		it 'should be valid' do
			subject
			expect(subject).to be_valid
		end
	end
end