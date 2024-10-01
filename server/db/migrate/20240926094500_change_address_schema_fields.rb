class ChangeAddressSchemaFields < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :tele, :string
    remove_column :addresses, :address_line2, :string
    rename_column :addresses, :address_line1, :address
    add_column :addresses, :tele, :string
  end
end
