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

	context "given created user" do
		before(:each) do

			@user = create :user
			params = {email: @user.email, password: @user.password}
			auth = UserAuthenticator.new(params).perform

			token = auth[0]
			
			request.headers['Authorization'] = token
		end

		describe "#update" do
			it "should return 204 no content when updated" do
				# user = create :user
				# pp @user
				put :update, params: {id:@user.id, _username:@user.username, username: "new_user"}
				# pp Contact.find(@user.id)
				expect(response.status).to eq(204)
				# expect{ Contact.find_by_username("new_user") }.to be_successful
				expect(User.find_by_username("new_user").fullname).to eq("Shannon Stone")
			end
		end

		describe "#show" do

			it "should be able to get user" do

				get :show, params: {_username: @user.username}
				# expect(response).to
			end
		end
	end
end
