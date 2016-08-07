class AddRemoteOrderIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :remote_order_id, :string
  end
end

