FactoryGirl.define do
	factory :user do
		name_first "Dillon"
		name_last "Drenzek"
		email "dr.enzek@gmail.com"
		password "password"
		password_confirmation "password"
	end
end