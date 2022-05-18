require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "#index" do

		subject {get :index}

		it "should not be able to get user list without authorization" do
			subject
			# pp JSON.parse(response.body)
			expect(response).to_not be_successful
		end

		it "should require Json web token" do
			subject
			expect(response.body).to include("Nil JSON web token")
		end
	end

	describe "#create" do
		subject {post :create, params: 
			{
				email: "t.senju@gmail.com",
				username: "embraceyoursexuality",
				fullname: "Tsunade Senju",
				password: "1234567890"
			}
		}

		it "should not create a user without password confirmation" do
			subject
			expect(response.body).to include("Password confiramtion not present")
		end
	end

	describe "#update" do
		it "should return 204 no content when updated" do
			user = create :user
			user.update(username: "new user")

			expect(response).to be_successful
		end
	end
end
