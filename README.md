# RawgentoModels

Models to deal with Magento shop data of a specific shop instance.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rawgento_models'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rawgento_models

## Usage

1. Require this gem in your application.

    # yourapp.gemspec
    require 'rawgento_models'

    $ bundle install

2. Add the db-specific tasks to your Rakefile.

    # Rakefile
    RawgentoModels.load_tasks

3. Configure your database

    # db/config.yml as in a vanilla rails
      adapter: ...
      host: ...
      #...

4. Setup your database

    # TODO this does not yet work
    rake db:migrate

5. Use Models in your application

    # yourapp.rb
    require 'rawgento_models'

    RawgentoModels.establish_connection
    # Or specify your configuration file
    #RawgentoModels.establish_connection("alternative-config-file.yml")

    RawgentoModels::LocalProducts.all
    # or include the RawgentoModels module/namespace
    include RawgentoModels
    LocalProducts.all

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec rawgento_models` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Create new migrations

Its easiest to copy an existing migration (from db/migrate), adjust the timestamp in the file name and replace the actual migration code.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rawgento_models. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

