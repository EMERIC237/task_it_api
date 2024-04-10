class User < ApplicationRecord
  # Associations
  has_many :tasks, dependent: :destroy
  has_many :daily_plans, dependent: :destroy

  # Validations
  validates :username, :password, :email, :first_name, :last_name, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false }

  # It's a good practice to add constraints to the length of the input to prevent very long inputs.
  validates :username, length: { in: 3..20 }
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } # Ensures email format is valid

  # Security
  has_secure_password

  # Callbacks
  # Consider adding any callbacks you might need. For example, to downcase emails before saving to ensure uniqueness.
  before_save :downcase_email

  private

  def downcase_email
    self.email.downcase!
  end
end
