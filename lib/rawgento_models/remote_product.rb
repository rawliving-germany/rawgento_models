module RawgentoModels
  class RemoteProduct < ActiveRecord::Base
    belongs_to :local_product

    scope :supplied_by, ->(supplier_name) { where(supplier: supplier_name) }

    def self.linked
      self.where.not(local_product: nil)
    end

    def self.unlinked
      self.where(local_product: nil)
    end
  end
end

