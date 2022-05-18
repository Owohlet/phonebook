require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
	describe "#login" do
		context "when successful" do
			it "should return valid token" do
				user = create :user

				post :login, params: {email: user.email, password: user.password}

				expect(response.body).to include("token")
			end
		end

		context "when not successful" do
			it "should return unauthorized" do
				user = create :user

				post :login, params: {email: user.email, password: "invalid password"}

				expect(response.body).to include("unauthorized")
			end
		end
	end

end