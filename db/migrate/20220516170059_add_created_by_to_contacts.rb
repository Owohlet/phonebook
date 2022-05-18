class AddCreatedByToContacts < ActiveRecord::Migration[5.2]
	def change
		add_column :contacts, :created_by, :string
	end
end
