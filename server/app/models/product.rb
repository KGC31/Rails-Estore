class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :cart_items, class_name: "CartItem"
  has_many :order_items, class_name: "OrderItem"

  validates :name, uniqueness: { case_sensitive: false, message: "Product has already existed" }
end
