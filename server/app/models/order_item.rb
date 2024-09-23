class OrderItem < ApplicationRecord
  belongs_to :order, depenedent: :destroy
  belongs_to :product
end
