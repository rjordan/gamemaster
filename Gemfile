# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'

gem 'rails', '3.0.0.rc'

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"
gem "postgres-pr", :group=>[:stage,:production]

gem 'responders'
gem 'shoulda', :group=>:test
gem 'bcrypt-ruby'
gem 'warden'
gem 'devise', '~>1.1.0'
gem 'RedCloth'
gem 'html5'

## Bundle gems used only in certain environments:
# gem "rspec", :group => :test
# group :test do
#   gem "webrat"
# end

group :development do
  #These are just for console debugging
  gem 'hirb', :require=>false
  gem 'wirble', :require=>false
  gem 'less'
end
