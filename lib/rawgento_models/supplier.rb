module RawgentoModels
  class Supplier < ActiveRecord::Base
    has_many :local_products
    has_many :remote_products
  end
end
