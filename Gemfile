source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'mysql2', '~> 0.3.13'
gem 'json', '~> 1.8.0'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 3.2.3'
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'bootstrap-sass', '~> 2.3.2.1'
gem 'bootstrap-datetime-picker-for-rails'
gem 'devise'                              # Manage user authentication
gem "haml-rails"                          # HTML Abstraction Markup Language
gem 'jquery-rails', "< 3.0.0"             # Provide jQuery
# gem 'bootstrap-wysihtml5-rails'           # Jquery HTML editor
gem 'high_voltage', ' 1.2.2'              # Facilitates 'static' pages
# gem 'rmagick'                             # Interface to ImageMagick
# gem 'carrierwave', '~> 0.5.0'             # Manage file uploads
gem 'bootstrap-will_paginate'             # Paginations (making pages)
gem 'rails_config'                        # Manage settings in convenient (public vs private) fashion
# gem 'validates_email_format_of', :git  => 'git://github.com/alexdunae/validates_email_format_of.git' #Validates email.
gem 'simple_form', '~> 2.1'               # Manage forms                           
# gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby' # Credit card payments
# gem 'activemerchant', '~> 1.42.0', require: 'active_merchant' # Required for transitions gem
# gem 'transitions', '~> 0.1.4', require: ['transitions', 'active_model/transitions'] # Implement state machine
# gem 'carmen-rails', '~> 1.0.0'
gem 'unicorn'                             # Use unicorn as the app server

group :development do
  gem "better_errors"                     # Replace Rails error page with a more useful error page
  gem "binding_of_caller"                 # Allow better_errors to provide REPL (Read - Eval - Print - Loop) functionality
  gem 'quiet_assets'                      # Turns off the Rails asset pipeline log
  gem 'capistrano', '~> 2.14.2', :require => false      # Deploy with Capistrano
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem "database_cleaner"
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', :require => false
end