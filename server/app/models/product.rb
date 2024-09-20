class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: false, message: "Product has already existed" }
end
