class Category < ApplicationRecord
  has_many :products, class_name: "product", foreign_key: "product_id"

  validates :name, uniqueness: { case_sensitive: false, message: "Email has already been taken" }
end
