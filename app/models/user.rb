class User < ApplicationRecord
  attr_accessor :password
  validates :email, presence: true
end
