require 'rails_helper'

describe 'user routes' do
	it 'should route to users index' do
		expect(get '/users').to route_to("users#index")
	end

	it 'should route to users create' do
		expect(post '/users').to route_to("users#create")
	end

	it 'should route to show a user' do
		user = create :user
		expect(get "/users/#{user.username}").to route_to("users#show", _username: "#{user.username}")
	end

end

describe 'login routes' do
	it 'should route to login' do
		expect(post 'auth/login').to route_to("authentication#login")
	end
end