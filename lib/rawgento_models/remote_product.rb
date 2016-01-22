module RawgentoModels
  class RemoteProduct < ActiveRecord::Base
    belongs_to :local_product
    def self.linked
      self.where.not(local_product: nil)
    end
    def self.unlinked
      self.where(local_product: nil)
    end
  end
end

