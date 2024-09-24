class DeleteCountryInBrands < ActiveRecord::Migration[7.1]
  def change
    remove_column :brands, :country
  end
end
