module RawgentoModels
  class LocalProduct < ActiveRecord::Base
    has_one :remote_product
    has_many :stock_items
  end
end
