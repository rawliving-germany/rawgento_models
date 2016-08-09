class AddRemoteOrderLinkToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :remote_order_link, :string
  end
end
