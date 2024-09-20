class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  has_one :product, class_name: "product", foreign_key: "product_id"
end
