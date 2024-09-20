class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :payment_method, default: 'credit', null: false # e.g., 'credit_card', 'paypal'
      t.string :status, default: "pending", null: false
      t.decimal :amount, default: 0.0, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
