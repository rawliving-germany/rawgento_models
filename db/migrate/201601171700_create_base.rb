class CreateBase < ActiveRecord::Migration
  def change
    create_table :local_products do |p|
      p.string   :name
      p.string   :supplier
      p.integer  :product_id
      p.datetime "created_at", null: false
      p.datetime "updated_at", null: false
    end
    add_index :local_products, :product_id, unique: true

    create_table :remote_products do |p|
      p.string     :name
      p.string     :supplier
      p.references :local_product, index: true
      p.integer    :product_id
      p.datetime   "created_at", null: false
      p.datetime   "updated_at", null: false
    end

    create_table :stock_items do |p|
      p.references :local_product
      p.integer    :qty
      p.datetime   :date
      p.datetime   "created_at", null: false
      p.datetime   "updated_at", null: false
    end
    add_index :stock_items, :local_product_id
  end
end
