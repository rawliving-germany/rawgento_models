require 'active_record'
require 'active_record_migrations'

require "rawgento_models/version"
require "rawgento_models/stock_item"
require "rawgento_models/local_product"
require "rawgento_models/remote_product"

require 'yaml'
require 'ostruct'

module RawgentoModels
  # Reads config and wires up AR
  def self.establish_connection
    config = OpenStruct.new YAML.load_file("db/config.yml")
    ActiveRecord::Base.establish_connection(config.default)
    #ActiveRecord::Base.establish_connection({
    #  :adapter => 'mysql2',
    #  :host => 'localhost',
    #  :username => 'dbuser',
    #  :password => '',
    #  :database => 'your_database',
    #})
  end

  def self.load_tasks
    #load 'active_record/railties/databases.rake'
    ActiveRecordMigrations.load_tasks
    #load "rawgento_models.rake"
  end
end
