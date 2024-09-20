class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :payment

  has_many :order_items, class_name: "order_item"
end
