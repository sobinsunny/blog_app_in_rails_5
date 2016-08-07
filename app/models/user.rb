class User < ApplicationRecord
  attr_accessor :password
  has_many :posts, foreign_key: 'author_id'
  validates :email, :name, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  after_save :set_user_name

  def has_password?(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def set_user_name
    self.name = "blog_#{name}"
  end

  protected

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
