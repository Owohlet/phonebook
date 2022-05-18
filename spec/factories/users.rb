FactoryBot.define do
	factory :user do
		sequence(:email) { |n| "s.stone#{n}@gmail.com" }
		fullname { "Shannon Stone" }
		username { "sstone" }
		password { "1234567890" }
	end
end
