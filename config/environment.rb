# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_gamemaster_session',
    :secret      => '88f2d31d7173d71598bc7545c562333ed7aeca36909947e1a7e1db3e9024972720d241162f2b76eb2fbaebcd31001f14aa2446459ce843aed06c382105f976af'
  }


  #config.gem 'jscruggs-metric_fu', :version => '1.1.1', :lib => 'metric_fu', :source => 'http://gems.github.com'  
  #config.gem "sqlite3-ruby", :lib => false
  #config.gem "RedCloth"
  #config.gem "mocha"
  config.gem 'rails', :lib=>false, :version => RAILS_GEM_VERSION
  config.gem 'sqlite3-ruby', :lib => false
  config.gem 'ruby-openid', :lib => 'openid'
  config.gem 'authlogic'
  config.gem 'authlogic-oid', :lib => 'authlogic_openid'
  config.gem 'thoughtbot-shoulda', :lib => 'shoulda/rails', :source => 'http://gems.github.com'
  config.gem 'mocha'
  config.gem "RedCloth"

#The Metric-Fu suite
  #config.gem 'jscruggs-metric_fu', :lib => 'metric_fu', :source => 'http://gems.github.com'
  #config.gem 'reek', :lib=>false
  #config.gem 'roodi', :lib=>false
  #config.gem 'rcov', :lib=>false
  #config.gem 'topfunky-gruff', :lib=>false
  #config.gem 'rmagick', :lib=>false


  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  #config.active_record.default_timezone = :utc
  config.time_zone = 'UTC'
end
