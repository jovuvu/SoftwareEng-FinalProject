FactoryGirl.define do
	factory :user do
		name_first "Dillon"
		name_last "Drenzek"
		email "dr.enzek@gmail.com"
		dob "05-05-2014"
		gender "Male"
		interests ""
		quotes ""
		tv_and_movies ""
		music ""
		password "password"
		password_confirmation "password"
	end
	
	factory :post do
	end
	
	factory :relationship do
	  confirmed true
	end
end