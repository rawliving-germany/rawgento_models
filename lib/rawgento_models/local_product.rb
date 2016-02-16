module RawgentoModels
  class LocalProduct < ActiveRecord::Base
    has_one :remote_product
    has_many :stock_items
    has_many :order_items
    has_many :orders, through: :order_items
    belongs_to :supplier

    default_scope { order("name ASC") }

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

    def link_suggestions
      guesses = []
      guesses << RemoteProduct.supplied_by(self.supplier).where(name: self.name).to_a
      guesses << RemoteProduct.supplied_by(self.supplier).where("lower(name) like ?",
                                     "%#{self.name.downcase[0..self.name.size/2]}%").to_a
      guesses.flatten.uniq
    end
  end
end
