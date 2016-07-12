class AddSupplierAttributesToLocalProduct < ActiveRecord::Migration
  def change
    add_column :local_products, :supplier_sku,       :string
    add_column :local_products, :supplier_prod_name, :string
  end
end

