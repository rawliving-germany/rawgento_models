class AddNumStockedToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :num_stocked, :integer
  end
end
