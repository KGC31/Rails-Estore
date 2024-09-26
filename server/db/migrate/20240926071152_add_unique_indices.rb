class AddUniqueIndices < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :order, type: :uuid, foreign_key: { to_table: :orders }
    remove_column :payments, :user_id
    add_index :cart_items, [:cart_id, :product_id], unique: true
    add_index :order_items, [:order_id, :product_id] , unique: true
  end
end
