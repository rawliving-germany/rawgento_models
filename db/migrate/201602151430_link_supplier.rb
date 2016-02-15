class LinkSupplier < ActiveRecord::Migration
  include RawgentoModels
  def change
    add_reference :local_products, :supplier, index: true
    add_reference :remote_products, :supplier, index: true
    add_foreign_key :local_products, :suppliers
    add_foreign_key :remote_products, :suppliers

    LocalProduct.find_each do |local_product|
      supplier = Supplier.find_or_create_by(name: local_product.supplier_name)
      local_product.supplier = supplier
    end

    RemoteProduct.find_each do |local_product|
      supplier = Supplier.find_or_initialize_by(name: local_product.supplier_name)
      local_product.supplier = supplier
    end

    remove_column :local_products, :supplier_name
    remove_column :remote_products, :supplier_name
  end
end
