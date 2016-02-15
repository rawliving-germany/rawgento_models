class CreateSupplier < ActiveRecord::Migration
  def change
    create_table :suppliers do |p|
      p.string :name, index: true
      p.boolean :remote_shop, default: false
      p.datetime "created_at", null: false
      p.datetime "updated_at", null: false
    end
  end
end
