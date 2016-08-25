module RawgentoModels
  class RemoteProduct < ActiveRecord::Base
    belongs_to :local_product
    belongs_to :supplier

    default_scope { order("name ASC") }

    scope :supplied_by, ->(supplier) { where(supplier: supplier) }

    def self.linked
      self.where.not(local_product: nil)
    end

    def self.unlinked
      self.where(local_product: nil)
    end

    # SQLite specific
    def self.name_ilike name
      where('lower(name) LIKE ?', "%#{name.downcase}%")
    end
  end
end

