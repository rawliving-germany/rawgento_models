class AddEmailAndOrderTemplateToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :email, :string
    add_column :suppliers, :order_template, :text
  end
end
