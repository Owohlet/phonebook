class ContactsController < ApplicationController
	before_action :authorize_request, except: %i[show index]
	

	def index
		@contacts = Contact.all.newest_first
		render json: @contacts, status: :ok
	end

	def create
		# binding.pry
		@contact = Contact.new(contact_params.merge(created_by: @current_user.username))
		if @contact.save
			History.create(contact_id: @contact.id, first_name: @contact.first_name, last_name: @contact.last_name, email: @contact.email, phone_number: @contact.phone_number, updated_by: @current_user.username )
			render json: @contact, status: :created
		else
			render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def show
		@contact = Contact.find(params[:id])
		render json: @contact, include: ['histories'], status: :ok
	end

	def update
		@contact = Contact.find(params[:id])
		old_contact = @contact.first_name + @contact.last_name + @contact.email + @contact.phone_number
		# binding.pry
		if @contact.update(contact_params)
			new_contact = @contact.first_name + @contact.last_name + @contact.email + @contact.phone_number
			# binding.pry
			if !(old_contact == new_contact)
				History.create(contact_id: @contact.id, first_name: @contact.first_name, last_name: @contact.last_name, email: @contact.email, phone_number: @contact.phone_number, updated_by: @current_user.username )
			end
			
			render json: @contact, status: :ok
		else
			render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
	end


	private
	def contact_params
		params.permit(:first_name, :last_name, :email, :phone_number)
	end

end
