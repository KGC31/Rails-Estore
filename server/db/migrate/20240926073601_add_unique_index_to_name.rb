class AddUniqueIndexToName < ActiveRecord::Migration[7.1]
  def change
    add_index :products, :name, unique: true
    add_index :brands, :name, unique: true
    add_index :categories, :name, unique: true
  end
end
