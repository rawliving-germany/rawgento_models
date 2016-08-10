class AddHiddenToLocalProducts < ActiveRecord::Migration
  def change
    rename_column :local_products, :active, :hidden
    add_column :local_products, :active, :boolean
  end
end
