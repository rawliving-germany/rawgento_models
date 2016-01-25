module RawgentoModels
  class OrderItem < ActiveRecord::Base
    belongs_to :order
  end
end
