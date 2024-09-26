class Order < ApplicationRecord
  has_one :order
  belongs_to :user, dependent: :destroy
  belongs_to :address

  has_many :order_items, class_name: "order_item"
end
