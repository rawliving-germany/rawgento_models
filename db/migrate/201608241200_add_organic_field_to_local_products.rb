class AddOrganicFieldToLocalProducts < ActiveRecord::Migration
  def change
    add_column :local_products, :organic, :boolean
  end
end

