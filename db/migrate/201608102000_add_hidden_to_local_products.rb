class AddHiddenToLocalProducts < ActiveRecord::Migration
  def change
    rename_column :local_products, :active, :hidden
    change_column_default :local_products, :hidden, false
    change_column_null :local_products, :hidden, false, false

    add_column :local_products, :active, :boolean, default: true, null: false

    local_products = RawgentoModels::LocalProduct
    local_products.unscoped.find_each do |p|
      p.hidden = !p.hidden
      p.save!
    end
  end
end
