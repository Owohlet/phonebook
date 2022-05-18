FactoryBot.define do
	factory :contact do
		sequence(:first_name) { |n| "Hagamoro #{n}" }
		sequence(:last_name) { |n| "Otsutsuki #{n}" }
		sequence(:email) { |n| "h.otsutsuki#{n}@gmail.com" }
		sequence(:phone_number) { |n| "+234706#{n}789654" }
		created_by { "thelasttail" }
	end
end
