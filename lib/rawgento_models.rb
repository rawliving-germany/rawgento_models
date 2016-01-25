require 'active_record'
require 'active_record_migrations'

require "rawgento_models/version"
require "rawgento_models/stock_item"
require "rawgento_models/local_product"
require "rawgento_models/remote_product"

require 'yaml'
require 'ostruct'

module RawgentoModels
  # When required, provide migrations.
  MIGRATION_PATH = File.expand_path(File.join __dir__, '..', 'db', 'migrate')
  ActiveRecordMigrations.configure {|c| c.migrations_paths = [MIGRATION_PATH] }

  CONF_FILE = "db/config.yml"

  # Reads config and wires up AR
  def self.establish_connection(config_file_path=CONF_FILE)
    config = OpenStruct.new YAML.load_file(config_file_path)
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
