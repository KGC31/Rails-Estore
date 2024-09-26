class Brand < ApplicationRecord
  has_many :products, class_name: "Product", dependent: :restrict_with_error

  validates :name, uniqueness: { case_sensitive: false, message: "Brand has already existed" }
end