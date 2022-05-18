require 'rails_helper'

RSpec.describe Contact, type: :model do
	context 'should have an email' do
		subject {build :contact, email: ""}
		it_behaves_like "present_email"
	end

	context 'should have a valid email' do
		subject {build :contact, email: "myemail"}
		it_behaves_like "valid_email"
	end

	context 'email should be unique' do
		subject {contact1 = create :contact; contact2 = build :contact, email: contact1.email}
		it_behaves_like "unique_email"
	end

	context 'it should have valid factory' do
		subject {create :contact}
		it_behaves_like "valid_factory"
	end

	context 'a new contact' do
		it "should have phone number present" do
			contact = build :contact, phone_number: ""
			expect(contact).to_not be_valid
		end
		it "should have first name present" do
			contact = build :contact, first_name: ""
			expect(contact).to_not be_valid
		end
		it "should have last name present" do
			contact = build :contact, last_name: ""
			expect(contact).to_not be_valid
		end
	end

end
