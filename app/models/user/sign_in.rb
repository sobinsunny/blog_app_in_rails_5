class User::SignIn < ActiveType::Object
  # Handling signin activity
  attribute :email, :string
  attribute :password, :string
  validate  :existance_of_user
  validate  :authenticate_user

  def existance_of_user
    errors.add(:email, 'User not found') if user.nil?
  end

  def authenticate_user
    errors.add(:password, 'Invalid password') unless user && user.has_password?(password)
  end

  private

  def user
    User.find_by_email(email)
  end
end
