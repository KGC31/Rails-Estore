class Category < ApplicationRecord
  has_many :products, class_name: "product", dependent: :nullify

  validates :name, uniqueness: { case_sensitive: false, message: "Email has already been taken" }
end