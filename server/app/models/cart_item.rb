class CartItem < ApplicationRecord
  belongs_to :cart, dependent: :destroy
  belongs_to :product, dependent: :destroy

  add_index :cart_items, [:cart_id, :product_id], unique: true
end