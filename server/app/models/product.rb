class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :cart_items, class_name: "cart_item"
  has_many :order_items, order_name: "cart_item"

  validates :name, uniqueness: { case_sensitive: false, message: "Product has already existed" }
end
