class AddStateDatesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ordered_at, :datetime
    add_column :orders, :stocked_at, :datetime
  end
end

