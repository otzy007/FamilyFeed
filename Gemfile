source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 4.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# protected attributes. Trebuie scapat de ele
# gem 'protected_attributes'

gem 'gmaps4rails'
gem 'kaminari'
gem "simple_calendar"

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'bootstrap-sass'
  gem 'coffee-rails'
  gem "flat-ui-rails"
  gem "font-awesome-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise', '>= 3.0.0.rc'

group :production do
   gem 'pg'
   gem 'rails_12factor'
end

group :development do
#    gem 'railroady' #UMLs
#    gem "rails-erd" #nu cred ca mai e nevoie de umluri
   gem 'sqlite3'
end

group :test do
  gem 'cucumber-rails', :require => false
end

group :development, :test do
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'brakeman'
  gem 'ci_reporter'
  gem "simplecov-rcov"
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
