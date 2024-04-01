class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :daily_plans, dependent: :destroy
  validates :username, :password, :email, :first_name, :last_name, presence: true
  has_secure_password
end
