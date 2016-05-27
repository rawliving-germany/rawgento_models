module RawgentoModels
  class Order < ActiveRecord::Base
    has_many :order_items, -> { joins(:local_product) }
    scope :queued, -> { where(state: "queued") }

    def self.current
      find_by(state: "new")
    end
  end
end
