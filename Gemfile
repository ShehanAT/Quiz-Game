source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bundler', '~> 2.2.16'

gem 'poltergeist', '~> 1.10'

gem 'pry', '~> 0.12.2'

gem 'actionpack', '~> 6.1.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3.1'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
 gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails', '~> 4.3.5'

gem 'figaro'

gem 'remotipart', '~> 1.4.3'

gem "google-cloud-storage", "~> 1.11", require: false

gem 'materialize-sass', '~> 1.0.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'social-share-button', '0.2.1'

gem "font-awesome-rails"

gem 'activemodel', '6.1.3.1'

gem 'activerecord-session_store', '~> 2.0.0'

gem 'kaminari'

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

group :production do 
  gem 'pg'
  
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Easy installation and use of web drivers to run system tests with browsers

  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'rack_session_access'
end 

group :development, :test do
  gem 'rspec-rails', '~> 4.0.0.beta2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'sqlite3', '~> 1.4.2'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

end

group :test do
  gem 'culerity', '~> 0.2.15'
  gem 'capybara-culerity', '~> 0.0.1'
  # Adds support for Capybara system testing and selenium driver
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'capybara', '~> 3.29.0'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'rack_session_access'
  gem 'rails-controller-testing', '~> 1.0.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'factory_bot'