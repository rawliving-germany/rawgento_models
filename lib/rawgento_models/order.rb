module RawgentoModels
  class Order < ActiveRecord::Base
    has_many :order_items, -> { joins(:local_product) }
    belongs_to :supplier

    scope :queued, -> { where(state: "queued") }
    scope :in_state, ->(state) { where(state: state) }

    def self.current
      find_by(state: "new")
    end
  end
end
