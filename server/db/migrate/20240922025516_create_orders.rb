class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :status, default: 'pending' # order status: pending, shipped, delivered, etc.
      t.decimal :amount, default: 0.0, precision: 10, scale: 2, null: false
      t.references :address, null: false, foreign_key: true, type: :uuid
      t.references :payment, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
