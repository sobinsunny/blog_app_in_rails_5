class User::SignUp < ActiveType::Record[User]
  validates :password, confirmation: true
  validates :email, :password, :password_confirmation, :name, presence: true
  validates :password, length: { minimum: 6 }
end
