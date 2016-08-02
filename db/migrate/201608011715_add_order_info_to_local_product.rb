class AddOrderInfoToLocalProduct < ActiveRecord::Migration
  def change
    add_column :local_products, :order_info, :text
  end
end
