module RawgentoModels
  class RemoteProduct < ActiveRecord::Base
    belongs_to :local_product
  end
end

