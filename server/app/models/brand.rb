class Brand < ApplicationRecord
  has_many :products, class_name: "product"

  validates :name, uniqueness: { case_sensitive: false, message: "Brand has already existed" }
end