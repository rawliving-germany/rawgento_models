class AddPurchasePriceToLocalProduct < ActiveRecord::Migration
  def change
    add_column :local_products, :purchase_price, :decimal
  end
end
