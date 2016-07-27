FactoryGirl.define do
  factory :sign_up,:class=>User::SignUp do
	    name 'Sample Name'
	    email 'sample@gmail.com'
	    password 'rails_123'
  end
end
