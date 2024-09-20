class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :address_line1
      t.string :address_line2
      t.string :city

      t.timestamps
    end
  end
end
