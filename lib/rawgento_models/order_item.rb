module RawgentoModels
  class OrderItem < ActiveRecord::Base
    belongs_to :order, inverse_of: :order_items
    belongs_to :local_product, inverse_of: :order_items

    delegate :name, to: :local_product

    scope :processible, -> { where("num_wished  > 0") }
    # Actually its more like 'has been put in cart'
    scope :ordered,     -> { where("num_ordered > 0") }

    def remote_product_id
      local_product.remote_product.try(:product_id)
    end

    def all_ordered?
      num_wished == num_ordered
    end

    def out_of_stock?
      num_ordered == 0
    end

    def ordered?
      !not_ordered?
    end

    def not_ordered?
      num_ordered.nil?
    end

    def order_item_same_product before
      time_range = Date.civil(1970, 1, 1)..before
      OrderItem.where(local_product_id: self.local_product_id)
        .joins(:order).where(
          orders: { state: ['ordered', 'stocked'],
                    updated_at: time_range })
        .order("updated_at ASC")
    end
  end
end
