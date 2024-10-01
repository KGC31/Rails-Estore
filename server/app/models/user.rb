class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :refresh_token, dependent: :destroy

  after_create :create_cart

  # Ensure email is unique (case insensitive)
  validates :email, uniqueness: { case_sensitive: false, message: "has already been taken" }

  # Validate password
  validates :password, format: { with: /\A(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}\z/, message: "must be at least 6 characters, and include one number and one letter." }, allow_blank: true

  # Use has_secure_password for bcrypt password hashing
  has_secure_password

  # Define the list of valid roles
  ROLES = %w[user admin staff].freeze

  # Validate the role
  validates :role, inclusion: { in: ROLES, message: "%{value} is not a valid role" }

  private

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
