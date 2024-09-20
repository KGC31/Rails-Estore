class Brand < ApplicationRecord
  has_many :products, class_name: "product", foreign_key: "product_id"

  validates :name, uniqueness: { case_sensitive: false, message: "Brand has already existed" }
end