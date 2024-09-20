class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.references :brand, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :option, default: "", null: false
      t.integer :stock, default: 0, null: false
      t.text :description, default: "", null: false
      t.timestamps
    end
  end
end
