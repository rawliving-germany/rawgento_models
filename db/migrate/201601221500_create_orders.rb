class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |p|
      p.string  "state", default: :new
      p.datetime "created_at", null: false
      p.datetime "updated_at", null: false
    end

    create_table :order_items do |p|
      p.references :order, null: false
      p.string  "state", default: :new
      p.integer  "num_wished"
      p.integer  "num_ordered"
      p.references :remote_product
      p.datetime "created_at", null: false
      p.datetime "updated_at", null: false
    end
  end
end
