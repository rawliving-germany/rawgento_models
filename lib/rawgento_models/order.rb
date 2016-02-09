module RawgentoModels
  class Order < ActiveRecord::Base
    has_many :order_items
    scope :current, -> { find_by(state: "new") }
  end
end
