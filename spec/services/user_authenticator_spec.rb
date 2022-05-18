require 'rails_helper'

describe UserAuthenticator do
	describe "#perform" do

		context "when successful authorization" do

			it 'should return a token' do
				user = create :user
				params = {email: user.email, password: user.password}
				auth = UserAuthenticator.new(params).perform

				expect(auth).to be_an_instance_of(Array)
				expect(auth.length).to be(3)
			end
		end
	end
end