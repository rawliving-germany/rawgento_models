class ChangeSupplierColumns < ActiveRecord::Migration
  def change
    rename_column :local_products, :supplier, :supplier_name
    rename_column :remote_products, :supplier, :supplier_name
  end
end
