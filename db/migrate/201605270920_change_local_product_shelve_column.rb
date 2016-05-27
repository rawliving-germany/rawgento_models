class ChangeLocalProductShelveColumn < ActiveRecord::Migration
  def change
    change_column :local_products, :shelve_nr, :string
  end
end
