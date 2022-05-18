require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
	before(:each) do

		@user = create :user
		params = {email: @user.email, password: @user.password}
		auth = UserAuthenticator.new(params).perform

		token = auth[0]
		request.headers['Authorization'] = token
	end

	describe "#index" do

		subject { get :index }
		
		it "should list all contacts" do
			contact = create_list :contact, 3
			subject
			expect(response.status).to eq(200)
		end
	end

	subject { post :create, params: 
		{
			email: "t.senju@gmail.com",
			first_name: "Ino",
			last_name: "Yamanaka",
			phone_number: "+2349047384756"
			# created_by: @user.username
		} 
	}
	describe "#create" do

		it "should create a contact when all parameters are correct" do
			subject 
			expect(response).to have_http_status(:created)
		end

		it "should create a history when a contact is created" do
			subject
			expect(Contact.last.email).to eq(History.last.email)
		end

		it "should create a contact with the current_user username as creator" do
			subject
			expect(Contact.last.created_by).to eq(@user.username)
		end
	end

	describe "#update" do

		it "should update a contact when all parameters are correct" do

			subject

			put :update, params: {id:json_data["id"], first_name: "Kaeto"}

			expect(Contact.find(json_data["id"]).first_name).to eq("Kaeto")
		end

		it "should create a history when a contact is updated" do

			subject

			put :update, params: {id:json_data["id"], first_name: "Kaeto"}

			expect(Contact.find(json_data["id"]).histories.last.first_name).to eq("Kaeto")
			expect(Contact.find(json_data["id"]).histories.count).to eq(2)

			put :update, params: {id: json_data["id"], phone_number: "+2347030296544"}

			expect(Contact.find(json_data["id"]).histories.last.phone_number).to eq("+2347030296544")
			expect(Contact.find(json_data["id"]).histories.count).to eq(3)
		end

		it "should not create a new histroy if contact doesn't change on update" do
			subject 

			put :update, params: {id:json_data["id"], first_name: "Ino"}

			expect(Contact.find(json_data["id"]).histories.count).to eq(1)

		end


	end

	describe "#destroy" do
		it "should delete contact" do
			subject 

			delete :destroy, params: {id: json_data["id"]}
			expect(Contact.all.count).to eq(0)

		end

		it "should delete all histories when contact is deleted" do
			subject

			put :update, params: {id:json_data["id"], first_name: "Kaeto"}
			expect(Contact.find(json_data["id"]).histories.count).to eq(2)

			delete :destroy, params: {id: json_data["id"]}
			expect(Contact.all.count).to eq(0)
			expect(History.all.count).to eq(0)
		end
	end

	describe "#show" do
		it "should show a contact with histories" do
			subject
			get :show, params: {id:json_data["id"]}
			
			expect(json["included"][0]["attributes"]).to include("updated-by")
		end
	end
end