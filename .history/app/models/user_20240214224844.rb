class User < ApplicationRecord

  validates :username, :email, :first_name, :last_name, presence: true
  has_secure_password
end
