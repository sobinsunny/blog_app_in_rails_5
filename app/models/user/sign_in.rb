class User::SignIn < ActiveType::Object
	attribute :email,	 :string
	attribute :password  :string
	validate  :existance_of_user
	validate  :correct_password

	def existance_of_user
		if user.nil?
			errors.add(:email,"User not found")
		end
	end




private
 def user
 	User.find_by_email(self.email)
 	
 end

end
