class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  has_one :product, class_name: "product"
end
