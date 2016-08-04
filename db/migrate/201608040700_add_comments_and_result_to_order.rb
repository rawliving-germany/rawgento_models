class AddCommentsAndResultToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :internal_comment, :text
    add_column :orders, :public_comment,   :text
    add_column :orders, :order_result,     :text
  end
end

