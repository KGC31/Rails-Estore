class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items, id: :uuid do |t|
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.integer :quantity, default: 0, null: false
      t.decimal :amount, default: 0.0, precision: 10, scale: 2, null: false
      t.string :option, null: false

      t.timestamps
    end
  end
end
