class ExtendOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :local_product, index: true
    add_foreign_key :order_items, :local_products
    add_column :order_items, :current_stock, :integer
    add_column :order_items, :min_stock, :integer
    remove_column :order_items, :remote_product_id
  end
end
