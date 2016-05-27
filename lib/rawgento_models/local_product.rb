module RawgentoModels
  class LocalProduct < ActiveRecord::Base
    has_one :remote_product
    has_many :stock_items
    has_many :order_items, inverse_of: :local_product
    has_many :orders, through: :order_items
    belongs_to :supplier

    default_scope { where(active: true).order("name ASC") }

    scope :linked, -> {
      joins("LEFT OUTER JOIN " +
            "  remote_products " +
            "  ON remote_products.local_product_id = local_products.id").where("remote_products.id IS NOT null")
    }
    # scope :with_photos, -> { joins(:photos).distinct }

    scope :unlinked, -> {
      joins("LEFT OUTER JOIN " +
            "  remote_products " +
            "  ON remote_products.local_product_id = local_products.id").where("remote_products.id IS null")
    }
    # City.includes(:photos).where(photos: { city_id: nil }) # slower
    scope :supplied_by, ->(supplier) { where(supplier: supplier) }

    def self.all_hidden
      unscoped.where(active: false)
    end

    def link_suggestions limit=10
      guesses = []
      guesses << RemoteProduct.supplied_by(self.supplier).where(name: self.name).to_a
      guesses << RemoteProduct.supplied_by(self.supplier).where("lower(name) like ?",
                                                                "%#{self.name.downcase[0..self.name.size/2]}%")
                 .limit(limit).to_a
      guesses.flatten.uniq
    end
  end
end
