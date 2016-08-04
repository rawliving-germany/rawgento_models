class AddOrderMethodToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :order_method, :string
  end
end
