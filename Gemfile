source 'http://rubygems.org'

gem 'rails', '4.0.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'rake', '10.1.1'
  gem 'sqlite3'
  gem 'debugger'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
end
group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'therubyracer'     #removed because windows uses JScript         
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'uglifier'
  gem 'bcrypt-ruby', '~> 3.0.0'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
gem "haml-rails", :group => :development

gem 'turbolinks'
