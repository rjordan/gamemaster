# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'

gem 'rails', :git=>'git://github.com/rails/rails.git' #, '3.0.0.beta3'

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"
gem "postgres-pr", :group=>[:stage,:production]

gem 'responders'
gem 'shoulda', :group=>:test, :git=>'git://github.com/thoughtbot/shoulda.git' #, :branch=>'rails3'
gem 'bcrypt-ruby'
gem 'warden'
gem 'devise', :git=>'git://github.com/plataformatec/devise.git'
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
