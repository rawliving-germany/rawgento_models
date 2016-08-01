class ExtendSupplierFields < ActiveRecord::Migration
  def change
    add_column :suppliers, :delivery_time_days,  :integer
    add_column :suppliers, :order_info,          :text
    add_column :suppliers, :minimum_order_value, :decimal
  end
end

