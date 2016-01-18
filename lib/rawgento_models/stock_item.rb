module RawgentoModels
  class StockItem < ActiveRecord::Base
    belongs_to :local_product
  end
end
