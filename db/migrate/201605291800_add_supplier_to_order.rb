class AddSupplierToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :supplier, index: true
    add_foreign_key :orders, :suppliers
  end
end
