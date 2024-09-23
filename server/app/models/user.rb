class User < ApplicationRecord
  has_one :cart, class_name: "Cart"  # Capitalize the class names
  has_many :addresses, class_name: "Address"
  has_many :orders, class_name: "Order"
  has_many :payments, class_name: "Payment"

  # Ensure email is unique (case insensitive)
  validates :email, uniqueness: { case_sensitive: false, message: "has already been taken" }

  # Validate password (not password_digest directly, assuming you're using bcrypt for password hashing)
  validates :password, format: { with: /\A(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}\z/, message: "must be at least 6 characters, and include one number and one letter." }, allow_blank: true

  # Use has_secure_password for bcrypt password hashing
  has_secure_password
end
