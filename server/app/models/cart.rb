class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, class_name: "cart_item"
end
