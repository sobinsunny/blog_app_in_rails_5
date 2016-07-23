class User::SignUp < ActiveType::Record[User]
  validates :password, confirmation: true
  validates :email, :password, :password_confirmation, :name, presence: true
  validates :password, length: { minimum: 6 }
  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
