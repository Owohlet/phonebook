FactoryBot.define do
	factory :history do
		first_name { "MyString" }
		last_name { "MyString" }
		email { "MyString" }
		phone_number { "MyString" }
		updated_by { "thelasttail" }
		contact { nil }
	end
end
