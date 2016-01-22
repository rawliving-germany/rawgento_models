class ExtendProduct < ActiveRecord::Migration
  def change
    add_column :local_products, :shelve_nr, :integer
    add_column :local_products, :packsize, :integer
    add_column :local_products, :active, :boolean, default: true
  end
end
