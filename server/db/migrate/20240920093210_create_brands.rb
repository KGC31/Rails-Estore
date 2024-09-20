class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :country, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
