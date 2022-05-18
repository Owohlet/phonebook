require 'rails_helper'

describe 'contact routes' do
	it 'should route to contacts index' do
		expect(get '/contacts').to route_to("contacts#index")
	end

	it 'should route to contacts create' do
		expect(post '/contacts').to route_to("contacts#create")
	end

	it 'should route to contacts update' do
		contact = create :contact
		expect(put "/contacts/#{contact.id}").to route_to("contacts#update", id: "#{contact.id}")
	end

	it 'should route to contacts delete' do
		contact = create :contact
		expect(delete "/contacts/#{contact.id}").to route_to("contacts#destroy", id: "#{contact.id}")
	end

end

