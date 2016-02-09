module RawgentoModels
  class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :local_product

    delegate :name, to: :local_product
  end
end
