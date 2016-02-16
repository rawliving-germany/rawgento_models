module RawgentoModels
  class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :local_product

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
  end
end
