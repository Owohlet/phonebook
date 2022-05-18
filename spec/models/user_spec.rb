require 'rails_helper'

RSpec.describe User, type: :model do
	describe '#validations' do
		context 'should have an email' do
			subject {build :user, email: ""}
			it_behaves_like "present_email"
		end

		context 'should have a valid email' do
			subject {build :user, email: "myemail"}
			it_behaves_like "valid_email"
		end

		context 'email should be unique' do
			subject {user1 = create :user; user2 = build :user, email: user1.email}
			it_behaves_like "unique_email"
		end
		context 'should have valid factory' do
			subject {build :user}
			it_behaves_like "valid_factory"
		end
		context 'when creating a user' do


			it 'should have a password' do
				user = build :user, password: nil
				expect(user).to_not be_valid
			end

			it 'password should be at least 6 characters' do
				user = build :user, password: "123"
				expect(user).to_not be_valid
			end

			it 'should have a fullname' do
				user = build :user, fullname: nil
				expect(user).to_not be_valid
			end

			it 'should have a unique username' do
				user = build :user, username: nil
				expect(user).to_not be_valid

				user.username ="sstone"
				expect(user).to be_valid

				user.save
				user2 = build :user, username: user.username
				expect(user2).to_not be_valid
			end
		end
	end
end